<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="botDetect" uri="https://captcha.com/java/jsp"%>
<%@ page import="com.captcha.botdetect.web.servlet.Captcha"%>
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
            <!-- Campo de Usuário -->
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input id="user" type="text" name="user" placeholder="Usuário" value="<%= request.getParameter("user") != null ? request.getParameter("user") : "" %>" required />
            </div>
            
            <!-- Campo de Senha -->
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input id="password" type="password" name="password" placeholder="Senha" required />
            </div>
            
            <!-- BotDetect Captcha -->
            <label for="captchaCode" class="prompt"></label>
            <div class="captcha-container">
                <botDetect:captcha id="loginCaptcha" 
                    userInputID="captchaCode"
                    codeLength="4"
                    imageWidth="200"
                    codeStyle="ALPHA"
                    locale="pt-BR" />
                <input id="captchaCode" type="text" name="captchaCode" placeholder="Insira o código da imagem" required />
            </div>
            
            <!-- Botões -->
            <button class="btn" type="submit">Entrar</button>
            <button class="btn3"  onclick="window.location.href='signup.jsp'">Cadastrar</button>
            <button class="btn2" type="submit">Esqueci minha senha</button>

        </form>

        <%
            // Verificação se o formulário foi submetido e o código do CAPTCHA foi enviado
            String captchaCode = request.getParameter("captchaCode");
            String user = request.getParameter("user");
            String password = request.getParameter("password");

            if (captchaCode != null && !captchaCode.isEmpty()) {
                // Carregar o CAPTCHA gerado
                Captcha captcha = Captcha.load(request, "loginCaptcha");
                captcha.setUserInputID("captchaCode");

                // Verifica se o código inserido é válido
                boolean isCaptchaValid = captcha.validate(captchaCode);

                if (!isCaptchaValid) {
                    // Se o código do CAPTCHA for inválido, exibe uma mensagem de erro
                    out.println("<p style='color:red;'>Código CAPTCHA inválido. Tente novamente.</p>");
                } else {
                    // Caso o CAPTCHA seja válido, você pode proceder com a validação do login
                        // Se o login for bem-sucedido, cria uma sessão para o usuário
                        session.setAttribute("loggedIn", true);
                        // Redireciona para a página de sucesso
                        response.sendRedirect("successPage.jsp");
                    } else {
                        // Se as credenciais do login estiverem incorretas
                        out.println("<p style='color:red;'>Usuário ou senha inválidos.</p>");
                    }
                }
            }
        %>
    </div>
</body>
</html>
