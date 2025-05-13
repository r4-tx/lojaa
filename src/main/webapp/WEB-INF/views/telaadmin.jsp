<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Painel Administrativo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f2f2f2;
        }
        .admin-container {
            max-width: 800px;
            margin: 60px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<%
    String nome = (String) session.getAttribute("usuarioNome");
    String tipo = (String) session.getAttribute("tipo");

    if (nome == null || tipo == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    if (!"ADMIN".equalsIgnoreCase(tipo)) {
        response.sendRedirect("produtos");
        return;
    }
%>

<div class="admin-container">
    <h2 class="text-center text-success mb-4">Painel Administrativo</h2>
    <p class="text-center">Bem-vindo, <strong><%= nome %></strong>! Você está logado como <strong>Administrador</strong>.</p>

    <hr>

    <div class="row mt-4">
        <div class="col-md-6 mb-3">
            <!-- Botão Gerenciar Usuários -->
            <form action="usuarios" method="get">
                <button type="submit" class="btn btn-outline-primary w-100">
                    <i class="fas fa-users me-2"></i>Gerenciar Usuários
                </button>
            </form>
        </div>

        <div class="col-md-6 mb-3">
            <!-- Botão Gerenciar Produtos -->
            <form action="produtos" method="get">
                <button type="submit" class="btn btn-outline-success w-100">
                    <i class="fas fa-boxes me-2"></i>Gerenciar Produtos
                </button>
            </form>
        </div>

        <div class="col-md-6 mb-3">
            <!-- Botão Visualizar Pedidos -->
            <form action="pedidos" method="get">
                <button type="submit" class="btn btn-outline-warning w-100">
                    <i class="fas fa-receipt me-2"></i>Visualizar Pedidos
                </button>
            </form>
        </div>

        <div class="col-md-6 mb-3">
            <!-- Botão Logout -->
            <form action="logout" method="get">
                <button type="submit" class="btn btn-outline-danger w-100">
                    <i class="fas fa-sign-out-alt me-2"></i>Sair
                </button>
            </form>
        </div>
    </div>
</div>

<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
