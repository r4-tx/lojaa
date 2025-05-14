<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String usuarioLogado = (String) session.getAttribute("usuarioLogado");
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Loja Alijoz | Início</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/oi.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/ola.js" defer></script>
</head>
<body>

<header class="navbar">
    <div class="container">
        <div class="logo"><i class="fas fa-store"></i> Loja <span>Alijoz</span></div>
        <nav>
            <ul class="nav-links">
                <li><a href="index">Início</a></li>
                <li><a href="produtos?view=lista">Produtos</a></li>
                <li><a href="carrinho">Carrinho</a></li>
                <li><a href="contato">Contato</a></li>
                <c:choose>
                    <c:when test="${empty usuarioLogado}">
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

<section class="hero">
    <div class="container">
        <div class="hero-content">
            <h1>Experiência premium em tecnologia</h1>
            <p>Os melhores produtos com o atendimento que você merece</p>
            <a href="produtos?view=lista" class="btn">Ver Produtos</a>
        </div>
    </div>
</section>

<section class="produtos-destaque">
    <div class="container">
        <h2>Produtos em Destaque</h2>
        <div class="grid-produtos">

            <!-- Produto: iPhone 16 Pro -->
            <div class="card-produto">
                <img src="${pageContext.request.contextPath}/assets/img/iphone.jpg" alt="iPhone 16 Pro">
                <h3>iPhone 16 Pro</h3>
                <p class="preco">R$ 7.999,00</p>
                <form action="${pageContext.request.contextPath}/carrinho" method="post">
                    <input type="hidden" name="acao" value="adicionar">
                    <input type="hidden" name="produtoId" value="6">
                    <input type="hidden" name="quantidade" value="1">
                    <button type="submit" class="btn btn-pequeno">Adicionar</button>
                </form>
            </div>

            <!-- Produto: Motorola EDGE 50 -->
            <div class="card-produto">
                <img src="${pageContext.request.contextPath}/assets/img/motorola.jpg" alt="Motorola EDGE 50">
                <h3>Motorola EDGE 50</h3>
                <p class="preco">R$ 4.899,00</p>
                <form action="${pageContext.request.contextPath}/carrinho" method="post">
                    <input type="hidden" name="acao" value="adicionar">
                    <input type="hidden" name="produtoId" value="7">
                    <input type="hidden" name="quantidade" value="1">
                    <button type="submit" class="btn btn-pequeno">Adicionar</button>
                </form>
            </div>

            <!-- Produto: Samsung S25 Ultra -->
            <div class="card-produto">
                <img src="${pageContext.request.contextPath}/assets/img/samsung.jpg" alt="Samsung S25 Ultra">
                <h3>Samsung S25 Ultra</h3>
                <p class="preco">R$ 7.499,00</p>
                <form action="${pageContext.request.contextPath}/carrinho" method="post">
                    <input type="hidden" name="acao" value="adicionar">
                    <input type="hidden" name="produtoId" value="8">
                    <input type="hidden" name="quantidade" value="1">
                    <button type="submit" class="btn btn-pequeno">Adicionar</button>
                </form>
            </div>

        </div>
    </div>
</section>
</section>

<section class="sobre-nos">
    <div class="container">
        <h2>Sobre a Loja Alijoz</h2>
        <p>Fundada por Willy, Vinicius, Rafael e Pedro Henrique, nossa missão é oferecer produtos de qualidade com inovação e confiança. Criamos uma experiência moderna e confiável para todos os nossos clientes.</p>
    </div>
</section>

<footer class="footer">
    <div class="container">
        <p>&copy; 2025 Loja Alijoz. Todos os direitos reservados.</p>
    </div>
</footer>

</body>
</html>
