<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>

    <!-- CSS para a página de logout -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        .logout-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }

        h3 {
            color: #4CAF50;
            font-size: 24px;
            margin-bottom: 20px;
        }

        a {
            color: #428bca;
            text-decoration: none;
            font-size: 16px;
            margin-top: 10px;
            display: inline-block;
            padding: 10px;
            background-color: #f1f1f1;
            border-radius: 4px;
        }

        a:hover {
            background-color: #428bca;
            color: white;
        }
    </style>
</head>
<body>
    <div class="logout-container">
        <%
            // Verificar se há uma sessão ativa
            if (session != null) {
                // Invalidar a sessão para fazer o logout
                session.invalidate();
                out.println("<h3>Você foi desconectado com sucesso!</h3>");
            } else {
                out.println("<h3>Não há sessão ativa.</h3>");
            }
        %>
        <a href="index.jsp">Voltar para a página de login</a>
    </div>
</body>
</html>

