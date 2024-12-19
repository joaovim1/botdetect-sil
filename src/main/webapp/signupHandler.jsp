<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Usuário</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="signup-container">
        <h4>Cadastrar</h4>

        <%
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            // Parâmetros de conexão com o banco H2
            String dbURL = "jdbc:h2:~/test";  // URL do banco H2
            String dbUser = "sa";  // Usuário padrão do H2
            String dbPass = "";    // Senha padrão do H2

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            boolean userExists = false;

            try {
                // Conectar ao banco de dados
                Class.forName("org.h2.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                // Verificar se o nome de usuário já existe
                String checkUserSQL = "SELECT * FROM usuarios WHERE nome = ? OR email = ?";
                stmt = conn.prepareStatement(checkUserSQL);
                stmt.setString(1, nome);
                stmt.setString(2, email);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    // Se um usuário com o mesmo nome ou e-mail for encontrado, define 'userExists' como true
                    userExists = true;
                } else {
                    // Caso não exista, fazer a inserção do novo usuário
                    String insertSQL = "INSERT INTO usuarios (nome, email, senha) VALUES (?, ?, ?)";
                    stmt = conn.prepareStatement(insertSQL);
                    stmt.setString(1, nome);
                    stmt.setString(2, email);
                    stmt.setString(3, senha);
                    int rowsInserted = stmt.executeUpdate();

                    if (rowsInserted > 0) {
                        out.println("<p style='color:green;'>Cadastro realizado com sucesso!</p>");
                    } else {
                        out.println("<p style='color:red;'>Erro ao cadastrar usuário.</p>");
                    }
                }
            } catch (Exception e) {
                out.println("<p style='color:red;'>Erro: " + e.getMessage() + "</p>");
            } finally {
                // Fechar a conexão com o banco de dados
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (userExists) {
                out.println("<p style='color:red;'>Usuário ou e-mail já está cadastrado. Tente outro.</p>");
            }
        %>

        <!-- Voltar ao formulário -->
        <button class="btn-back" onclick="window.location.href='signup.jsp'">Voltar</button>
    </div>
</body>
</html>
