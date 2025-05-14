<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Lista de Produtos</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/listaProdutos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>

<header class="navbar">
    <div class="container">
        <div class="logo">
            <i class="fas fa-store"></i> <span style="color:#0B5ED7;">Loja</span> <strong>Alijoz</strong>
        </div>
        <nav>
            <ul class="nav-links">
                <li><a href="index">Início</a></li>
                <li><a href="produtos?view=lista">Produtos</a></li>
                <li><a href="carrinho">Carrinho</a></li>
                <li><a href="contato">Contato</a></li>
                <c:choose>
                    <c:when test="${empty sessionScope.usuarioLogado}">
                        <li><a href="login.jsp" class="btn">Entrar</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="logout.jsp" class="btn">Sair</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </div>
</header>


<div class="container">
    <div class="top-bar">
        <input type="text" id="filtro" placeholder="Filtrar por nome..." class="input-filtro">
        <select id="ordenar" class="select-ordenar">
            <option value="asc">Preço crescente</option>
            <option value="desc">Preço decrescente</option>
        </select>
    </div>

    <div class="produtos-grid" id="produtos-container">
        <c:forEach var="p" items="${produtos}">
            <div class="card-produto" data-preco="${p.preco}" data-nome="${p.nome}">
                <h3>${p.nome}</h3>
                <p>${p.descricao}</p>
                <p class="preco">R$ ${p.preco}</p>
                <form action="${pageContext.request.contextPath}/carrinho" method="post">
                    <input type="hidden" name="acao" value="adicionar">
                    <input type="hidden" name="produtoId" value="${p.id}">
                    <input type="number" name="quantidade" value="1" min="1">
                    <button type="submit" class="btn-carrinho">Adicionar</button>
                </form>
            </div>
        </c:forEach>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/listaProdutos.js"></script>
</body>
</html>
