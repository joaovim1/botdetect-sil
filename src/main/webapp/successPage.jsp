<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Bem-Sucedido</title>

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <!-- CSS -->
    <link href="css/styleSuccess.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="login-container">
        <h2>Bem-vindo!</h2>

        <!-- Mensagem de Sucesso -->
        <div class="success-message">
            <p>Você fez login com sucesso!</p>
            <p>Bem-vindo, <strong><%= session.getAttribute("nome") %></strong>.</p>
        </div>
        <div class="btnQuit">
            <form action="logout.jsp" method="post">
                <button type="submit">Sair</button>
            </form>
        </div>

        <!-- Formulário para Cadastro de Itens -->
        <div class="panel">
            <h3>Adicionar Item</h3>
            <form action="addItem.jsp" method="post">
                <div class="input-item">
                    <input type="text" name="itemName" placeholder="Nome do Item" required>
                    <input type="number" name="itemValue" placeholder="Valor do Item" required>
                </div>
                <div class="input-item">
                    <button type="submit">Cadastrar Item</button>
                </div>
            </form>
        </div>

        <!-- Lista de Itens Adicionados -->
        <div class="panel">
            <h3>Itens Cadastrados</h3>
            <ul class="item-list" id="itemList">
                <% 
                    String dbURL = "jdbc:h2:~/test";  
                    String dbUser = "sa";  
                    String dbPass = "";    

                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        String nomeUsuario = (String) session.getAttribute("nome");
                        if (nomeUsuario != null) {
                            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                            // Obter o ID do usuário logado
                            String getUserIdSQL = "SELECT id FROM usuarios WHERE nome = ?";
                            stmt = conn.prepareStatement(getUserIdSQL);
                            stmt.setString(1, nomeUsuario);
                            rs = stmt.executeQuery();

                            if (rs.next()) {
                                int usuarioId = rs.getInt("id");

                                // Carregar os itens associados ao usuário
                                String getItemsSQL = "SELECT nome, valor FROM itens WHERE usuario_id = ?";
                                stmt = conn.prepareStatement(getItemsSQL);
                                stmt.setInt(1, usuarioId);
                                rs = stmt.executeQuery();

                                while (rs.next()) {
                                    String itemName = rs.getString("nome");
                                    double itemValue = rs.getDouble("valor");
                                    out.println("<li><span>" + itemName + "</span> - <span>R$ " + itemValue + "</span></li>");
                                }
                            }
                        }
                    } catch (Exception e) {
                        out.println("<p style='color:red;'>Erro ao conectar ao banco de dados: " + e.getMessage() + "</p>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </ul>
        </div>
    </div>
</body>
</html>
