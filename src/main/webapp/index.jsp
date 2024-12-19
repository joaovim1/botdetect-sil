<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="botDetect" uri="https://captcha.com/java/jsp"%>
<%@ page import="com.captcha.botdetect.web.servlet.Captcha" %>
<%@ page import="java.awt.datatransfer.*" %>
<%@ page import="java.sql.*" %> <!-- Importar classes para conexão JDBC -->
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sil Tecnologia Captcha</title>
    
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="icon" href="image/images.jpeg" sizes="192x192"/>

    <!-- CSS -->
    <link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="login-container">
        <div class="images">
            <img src="image/images.jpeg" alt="Imagem">
        </div>

        <h4>Acesso Contribuinte</h4>

        <!-- Formulário de Login -->
        <form action="index.jsp" method="post">
            <!-- Campo de Nome (Usuário) -->
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input id="nome" type="text" name="nome" placeholder="Nome de Usuário" value="<%= request.getParameter("nome") != null ? request.getParameter("nome") : "" %>" required />
            </div>

            <!-- Campo de Senha -->
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input id="senha" type="password" name="senha" placeholder="Senha" required />
            </div>

            <!-- BotDetect Captcha -->
            <label for="captchaCode" class="prompt"></label>
            <div class="captcha-container">
                <botDetect:captcha id="loginCaptcha" 
                    userInputID="captchaCode"
                    codeLength="4"
                    imageStyle="Overlap"
                    imageWidth="200"
                    codeStyle="ALPHA"
                    locale="pt-BR"
                />
                <input id="captchaCode" type="text" name="captchaCode" placeholder="Insira o código da imagem" required />
            </div>

            <!-- Botões -->
            <button class="btn" type="submit">Entrar</button>
            <button class="btn3" type="button" onclick="window.location.href='signup.jsp'">Cadastrar</button>
            <button class="btn2" type="button" onclick="window.location.href='forgot-password.jsp'">Esqueci minha senha</button>
        </form>

        <%
            // Recupera os dados do formulário
            String captchaCode = request.getParameter("captchaCode");
            String nome = request.getParameter("nome"); // Usando 'nome' no lugar de 'user'
            String senha = request.getParameter("senha"); // Usando 'senha' no lugar de 'password'

            // Conexão com o banco de dados H2
            String dbURL = "jdbc:h2:~/test";  // URL do banco H2 (em memória ou arquivo)
            String dbUser = "sa";  // Usuário padrão do H2
            String dbPass = "";    // Senha padrão do H2

            if (captchaCode != null && !captchaCode.isEmpty()) {
                // Carregar o CAPTCHA gerado
                Captcha captcha = Captcha.load(request, "loginCaptcha");
                captcha.setUserInputID("captchaCode");

                // Verifica se o código inserido é válido
                boolean isCaptchaValid = captcha.validate(captchaCode);

                if (!isCaptchaValid) {
                    // Se o código do CAPTCHA for inválido
                    out.println("<p style='color:red;'>Código CAPTCHA inválido. Tente novamente.</p>");
                } else {
                    // Caso o CAPTCHA seja válido, valida o login
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Conectar ao banco de dados
                        Class.forName("org.h2.Driver");
                        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                        // Consultar no banco de dados se o nome de usuário e senha informados existem
                        String sql = "SELECT * FROM usuarios WHERE nome = ? AND senha = ?";
                        stmt = conn.prepareStatement(sql);
                        stmt.setString(1, nome);  // Parametriza o nome do usuário
                        stmt.setString(2, senha);  // Parametriza a senha
                        rs = stmt.executeQuery();

                        // Verifica se o usuário foi encontrado
                        if (rs.next()) {
                            // Se o login for bem-sucedido, cria uma sessão para o usuário
                            session.setAttribute("loggedIn", true);
                            response.sendRedirect("successPage.jsp"); // Redireciona para a página de sucesso
                        } else {
                            // Se as credenciais do login estiverem incorretas
                            out.println("<p style='color:red;'>Usuário ou senha inválidos.</p>");
                        }
                    } catch (Exception e) {
                        out.println("<p style='color:red;'>Erro ao conectar ao banco de dados: " + e.getMessage() + "</p>");
                    } finally {
                        // Fechar a conexão e recursos
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        %>
    </div>
</body>
</html>
