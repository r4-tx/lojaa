<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Painel Administrativo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        body {
            background: linear-gradient(135deg, #0B5ED7, #003C90);
            font-family: 'Poppins', sans-serif;
            color: #fff;

            /* Centralização com Flexbox */
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
        }

        .admin-container {
            max-width: 900px;
            width: 100%;
            padding: 40px;
            background-color: rgba(255, 255, 255, 0.96);
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
            color: #333;
        }

        h2 {
            color: #0B5ED7;
        }

        .btn i {
            margin-right: 8px;
        }

        .btn-outline-primary {
            border-color: #0B5ED7;
            color: #0B5ED7;
        }

        .btn-outline-primary:hover {
            background-color: #0B5ED7;
            color: white;
        }

        .btn-outline-success {
            border-color: #198754;
            color: #198754;
        }

        .btn-outline-success:hover {
            background-color: #198754;
            color: white;
        }

        .btn-outline-warning {
            border-color: #ffc107;
            color: #ffc107;
        }

        .btn-outline-warning:hover {
            background-color: #ffc107;
            color: black;
        }

        .btn-outline-danger {
            border-color: #dc3545;
            color: #dc3545;
        }

        .btn-outline-danger:hover {
            background-color: #dc3545;
            color: white;
        }
    </style>
</head>
<body>

<%
    String nome = (String) session.getAttribute("usuarioLogado");
    String tipo = (String) session.getAttribute("tipo");

    if (nome == null || tipo == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    if (!"admin".equalsIgnoreCase(tipo)) {
        response.sendRedirect("acessoNegado.jsp");
        return;
    }
%>

<div class="admin-container text-center">
    <h2 class="mb-4">Painel do Administrador</h2>
    <p class="lead">Bem-vindo, <strong><%= nome %></strong>! Você está logado como <strong>Administrador</strong>.</p>

    <hr class="my-4">

    <div class="row mt-4">
        <div class="col-md-6 mb-3">
            <form action="usuarios" method="get">
                <button type="submit" class="btn btn-outline-primary w-100">
                    <i class="fas fa-users"></i> Gerenciar Usuários
                </button>
            </form>

        </div>

        <div class="col-md-6 mb-3">
            <form action="produtos" method="get">
                <button type="submit" class="btn btn-outline-success w-100">
                    <i class="fas fa-box-open"></i> Gerenciar Produtos
                </button>
            </form>
        </div>

        <div class="col-md-6 mb-3">
            <form action="pedidos" method="get">
                <button type="submit" class="btn btn-outline-warning w-100">
                    <i class="fas fa-receipt"></i> Visualizar Pedidos
                </button>
            </form>
        </div>

        <div class="col-md-6 mb-3">
            <form action="logout.jsp" method="get">
                <button type="submit" class="btn btn-outline-danger w-100">
                    <i class="fas fa-sign-out-alt"></i> Sair
                </button>
            </form>

        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
