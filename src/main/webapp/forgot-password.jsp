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
    <link href="css/style.css" rel="stylesheet" type="text/css">
    
    <style>
       
    </style>
</head>
<body>
    <div class="login-container">
        <div class="images">
            <img src="image/images.jpeg" alt="Imagem">
        </div>

        <!-- Mensagem de Sucesso -->
        <div class="success-message">
            <p><strong>LOGUE COM AS CREDENCIAIS ABAIXO</strong>.</p>
        </div>

            <div class="panel">
            <form id="itemForm">
 				<div class="input-group">
                <i class="fas fa-user"></i>
                <input id="user" type="text" name="user" value="admin" readonly="true" />
            </div>
             	<div class="input-group">
                <i class="fas fa-lock"></i>
                <input id="password" type="text" name="password" value="admin" readonly="true" />
            </div>
            </form>
           
        </div>


		 <button class="btn-back" onclick="window.location.href='index.jsp'">Voltar</button>
    </div>

</body>
</html>
