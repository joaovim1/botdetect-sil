<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    
    <style>
       
    </style>
</head>
<body>
    <div class="login-container">
        <div class="images">
            <img src="image/images.jpeg" alt="Imagem">
        </div>

        <h2>Bem-vindo!</h2>

        <!-- Mensagem de Sucesso -->
        <div class="success-message">
            <p>Você fez login com sucesso!</p>
            <p>Bem-vindo, <strong><%= request.getParameter("user") %></strong>.</p>
        </div>

        <!-- Painel para Adicionar Itens e Valores -->
        <div class="panel">
            <h3>Adicionar Itens e Valores</h3>
            <form id="itemForm">
                <div class="input-item">
                    <input type="text" id="itemName" placeholder="Nome do Item" required>
                    <input type="number" id="itemValue" placeholder="Valor do Item" required>
                </div>
                <div class="input-item">
                    <button type="button" onclick="addItem()">Adicionar Item</button>
                </div>
            </form>

            <!-- Lista de Itens Adicionados -->
            <ul class="item-list" id="itemList">
                <!-- Itens serão adicionados aqui -->
            </ul>
        </div>

        <!-- Botão de Logout -->
        <form action="logout.jsp" method="post">
            <button class="btn" type="submit">Sair</button>
        </form>
    </div>

    <script>
        // Função para adicionar item
        function addItem() {
            var itemName = document.getElementById("itemName").value;
            var itemValue = document.getElementById("itemValue").value;

            // Verificar se os campos não estão vazios
            if (itemName && itemValue) {
                // Criar o item na lista
                var list = document.getElementById("itemList");

                // Criar o item da lista
                var li = document.createElement("li");

                // Adicionar o nome e valor ao item da lista (usando concatenação de strings)
                li.innerHTML = '<span>' + itemName + '</span> - <span>R$ ' + parseFloat(itemValue).toFixed(2) + '</span>';

                // Adicionar o item à lista
                list.appendChild(li);

                // Limpar os campos de input
                document.getElementById("itemName").value = '';
                document.getElementById("itemValue").value = '';
            } else {
                alert("Por favor, preencha todos os campos.");
            }
        }
    </script>
</body>
</html>
