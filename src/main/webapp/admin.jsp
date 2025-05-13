<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    String tipo = (String) session.getAttribute("tipo");
    String nome = (String) session.getAttribute("usuarioLogado");

    if (tipo == null || !tipo.equals("admin")) {
        response.sendRedirect("acessoNegado.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Painel do Administrador</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #00A656, #007d47);
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #ffffff10;
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 16px;
            text-align: center;
            box-shadow: 0 8px 24px rgba(0,0,0,0.2);
            max-width: 500px;
            width: 90%;
        }

        h1 {
            font-size: 28px;
            margin-bottom: 10px;
        }

        p {
            font-size: 16px;
            margin-bottom: 30px;
        }

        .btn {
            display: inline-block;
            padding: 14px 24px;
            font-size: 16px;
            color: white;
            background-color: #FFD700;
            border: none;
            border-radius: 8px;
            margin: 10px;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background-color: #e6c300;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Bem-vindo, <%= nome %>!</h1>
    <p>Este é o painel exclusivo para administradores.</p>

    <a href="produtos" class="btn">Cadastrar Produto</a>
    <a href="produtos?view=lista" class="btn">Ver Produtos</a>
</div>

</body>
</html>
