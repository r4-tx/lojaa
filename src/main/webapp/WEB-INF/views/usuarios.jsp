<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Usuários Cadastrados</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="mb-4">Lista de Usuários</h2>
    <table class="table table-striped table-bordered">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Tipo</th>
            <th>Ação</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="usuario" items="${usuarios}">
            <tr>
                <td>${usuario.id}</td>
                <td>${usuario.nome}</td>
                <td>${usuario.email}</td>
                <td>${usuario.tipo}</td>
                <td>
                    <a href="usuarios?action=remover&id=${usuario.id}"
                       class="btn btn-sm btn-danger"
                       onclick="return confirm('Tem certeza que deseja remover este usuário?');">
                       Remover
                    </a>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="admin.jsp" class="btn btn-secondary mt-3">Voltar</a>
</div>
</body>
</html>
