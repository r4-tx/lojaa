<%
    if (session.getAttribute("usuarioLogado") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<h2>Lista de Produtos para Cliente</h2>
<p>Bem-vindo(a), <%= session.getAttribute("usuarioLogado") %>!</p>



<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Lista de Produtos</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/listaProdutos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/oi.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>

<!-- Navbar -->
<header class="navbar">
    <div class="logo">
        <i class="fas fa-store"></i> Loja <span class="highlight">Alijoz</span>
    </div>
    <nav>
        <ul class="nav-links">
            <c:choose>
                <c:when test="${empty usuarioLogado}">
                    <li><a href="login.jsp"><i class="fas fa-sign-in-alt"></i> Entre aqui</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Sair</a></li>
                </c:otherwise>
            </c:choose>
            <li><a href="index"><i class="fas fa-home"></i> Início</a></li>
            <li><a href="produtos"><i class="fas fa-box"></i> Produtos</a></li>
            <li><a href="carrinho"><i class="fas fa-shopping-cart"></i> Carrinho</a></li>
            <li><a href="contato"><i class="fas fa-envelope"></i> Contato</a></li>
        </ul>
        <div class="menu-toggle" id="mobile-menu">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </div>
    </nav>
</header>

<!-- Conteúdo principal -->
<div class="container">
    <a href="${pageContext.request.contextPath}/index.jsp" class="btn-voltar">Voltar</a>
    <h2>Produtos</h2>

    <input type="text" id="filtro" placeholder="Filtrar por nome..." class="input-filtro">

    <c:choose>
        <c:when test="${empty produtos}">
            <div class="alert">Nenhum produto encontrado.</div>
        </c:when>
        <c:otherwise>
            <table id="tabela-produtos">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Descrição</th>
                        <th>Preço</th>
                        <th>Quantidade Estoque</th>
                        <th>Adicionar ao Carrinho</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${produtos}">
                        <tr>
                            <td>${p.nome}</td>
                            <td>${p.descricao}</td>
                            <td>R$ ${p.preco}</td>
                            <td>${p.quantidade}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/carrinho" method="post" class="form-carrinho">
                                    <input type="hidden" name="acao" value="adicionar">
                                    <input type="hidden" name="produtoId" value="${p.id}">
                                    <input type="number" name="quantidade" value="1" min="1">
                                    <button type="submit" class="btn-carrinho">Adicionar</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
</div>

<script src="${pageContext.request.contextPath}/assets/js/listaProdutos.js"></script>
</body>
</html>
