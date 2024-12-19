<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Item</title>
</head>
<body>

<%
    String itemName = request.getParameter("itemName");
    String itemValue = request.getParameter("itemValue");

    if (itemName != null && itemValue != null) {
        // Conexão com o banco de dados
        String dbURL = "jdbc:h2:~/test";  
        String dbUser = "sa";  
        String dbPass = "";    

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Verificar se o usuário está logado
            String nomeUsuario = (String) session.getAttribute("nome");

            if (nomeUsuario != null) {
                // Obter o ID do usuário logado
                String getUserIdSQL = "SELECT id FROM usuarios WHERE nome = ?";
                stmt = conn.prepareStatement(getUserIdSQL);
                stmt.setString(1, nomeUsuario);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    int usuarioId = rs.getInt("id");

                    // Inserir o novo item associado ao usuário
                    String insertSQL = "INSERT INTO itens (nome, valor, usuario_id) VALUES (?, ?, ?)";
                    stmt = conn.prepareStatement(insertSQL);
                    stmt.setString(1, itemName);
                    stmt.setDouble(2, Double.parseDouble(itemValue)); // Converte para double
                    stmt.setInt(3, usuarioId);

                    int rowsInserted = stmt.executeUpdate();
                    if (rowsInserted > 0) {
                        out.println("<p>Item adicionado com sucesso!</p>");
                    } else {
                        out.println("<p style='color:red;'>Erro ao adicionar item.</p>");
                    }
                } else {
                    out.println("<p style='color:red;'>Usuário não encontrado!</p>");
                }
            } else {
                out.println("<p style='color:red;'>Usuário não está logado!</p>");
            }
        } catch (SQLException e) {
            out.println("<p style='color:red;'>Erro ao conectar ao banco de dados: " + e.getMessage() + "</p>");
            e.printStackTrace(); // Exibe o stack trace para depuração
        } catch (Exception e) {
            out.println("<p style='color:red;'>Erro inesperado: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    // Redirecionar após o processamento do código para evitar problemas de "cabeçalhos já enviados"
    response.sendRedirect("successPage.jsp");
%>

</body>
</html>
