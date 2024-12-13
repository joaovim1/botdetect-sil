<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar Cadastro</title>

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <!-- CSS -->
    <link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="signup-container">
        <h4>Cadastrar</h4>
        
        <!-- Formulário de Cadastro -->
        <form action="signupHandler.jsp" method="post">
            <!-- Campo de Nome -->
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input id="user" type="text" name="user" placeholder="Usuário" required />
            </div>
            
            <!-- Campo de E-mail -->
            <div class="input-group">
                <i class="fas fa-envelope"></i>
                <input id="email" type="email" name="email" placeholder="E-mail" required />
            </div>

            <!-- Campo de Senha -->
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input id="senha" type="password" name="senha" placeholder="Senha" required />
            </div>

            <!-- Botão de Cadastro -->
            <button class="btn" type="submit">Criar Conta</button>
             
            <button class="btn-back" onclick="window.location.href='index.jsp'">Voltar</button>
        
        </form>
    </div>
</body>
</html>
