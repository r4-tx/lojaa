<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String usuarioLogado = (String) session.getAttribute("usuarioLogado");
    if (usuarioLogado != null) {
%>
    <p>Bem-vindo, <%= usuarioLogado %> | <a href="logout.jsp">Logout</a></p>
<%
    }
%>

<%
    String erro = (String) request.getAttribute("erro");
    if (erro == null) {
        erro = "";
    }
%>

<% if (!erro.isEmpty()) { %>
    <p class="error-message"><i class="fas fa-exclamation-circle"></i> <%= erro %></p>
<% } %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loja Alijoz - Sua Melhor Escolha</title>

    <!-- Estilos CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/oi.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/produtos.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/carrinho.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <!-- JavaScript -->
    <script src="<%= request.getContextPath() %>/assets/js/carrinho.js" defer></script>
    <script src="<%= request.getContextPath() %>/assets/js/script.js" defer></script>
</head>
<body>

<!-- Navbar -->
<header class="navbar">
    <div class="logo">
        <i class="fas fa-store"></i> Loja <span class="highlight">Alijoz</span>
    </div>
    <nav>
        <ul class="nav-links">
            <% if (usuarioLogado == null) { %>
                <li><a href="login.jsp"><i class="fas fa-sign-in-alt"></i> Entre aqui</a></li>
            <% } else { %>
                <li><a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Sair</a></li>
            <% } %>
            <li><a href="index.jsp"><i class="fas fa-home"></i> Início</a></li>
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

<!-- Banner com Carrossel -->
<section class="banner">
    <div class="carousel">
        <div class="slides">
            <img src="<%= request.getContextPath() %>/assets/img/banner1.jpg" alt="Promoção Especial" class="active">
            <img src="<%= request.getContextPath() %>/assets/img/banner2.jpg" alt="Novidades da Semana">
            <img src="<%= request.getContextPath() %>/assets/img/banner3.jpg" alt="Descontos Exclusivos">
        </div>
        <button class="carousel-button prev" onclick="moveSlide(-1)">&#10094;</button>
        <button class="carousel-button next" onclick="moveSlide(1)">&#10095;</button>
    </div>
    <div class="banner-content">
        <div class="banner-text">
            <h1>Bem-vindo à Loja Alijoz</h1>
            <p>Os melhores produtos pelo melhor preço!</p>
            <a href="produtos" class="btn">Ver Produtos</a>
        </div>
    </div>
</section>

<!-- Produtos em Destaque -->
<section class="destaques">
    <h2>Produtos em Destaque</h2>
    <div class="produtos-container">
        <div class="produto">
            <img src="<%= request.getContextPath() %>/assets/img/iphone.jpg" alt="iPhone 16">
            <h3>iPhone 16</h3>
            <p>R$ 7.999,00</p>
            <button class="btn" onclick="adicionarAoCarrinho(1, 'iPhone 16', 7999)">Adicionar ao Carrinho</button>
        </div>
        <div class="produto">
            <img src="<%= request.getContextPath() %>/assets/img/motorola.jpg" alt="Motorola EDGE">
            <h3>Motorola EDGE</h3>
            <p>R$ 4.899,00</p>
            <button class="btn" onclick="adicionarAoCarrinho(2, 'Motorola EDGE', 4899)">Adicionar ao Carrinho</button>
        </div>
        <div class="produto">
            <img src="<%= request.getContextPath() %>/assets/img/samsung.jpg" alt="Samsung S25 ULTRA">
            <h3>Samsung S25 ULTRA</h3>
            <p>R$ 7.499,00</p>
            <button class="btn" onclick="adicionarAoCarrinho(3, 'Samsung S25 ULTRA', 7499)">Adicionar ao Carrinho</button>
        </div>
    </div>
</section>

<!-- Seção Sobre Nós -->
<section class="sobre-nos">
    <h2>Sobre a Loja Alijoz</h2>
    <p>Somos um time de quatro empreendedores apaixonados por tecnologia e inovação: <strong>Willy, Vinicius, Rafael e Pedro Henrique</strong>.</p>
    <p>Desde o início, tivemos a visão de criar uma loja online moderna, acessível e confiável, onde a experiência do cliente fosse a prioridade.</p>
    <p>Este projeto foi desenvolvido <strong>do zero</strong>, com dedicação e compromisso. Agradecemos a todos que nos apoiam nessa jornada e esperamos proporcionar a melhor experiência de compra para você!</p>
</section>

<!-- Seção de Avaliações -->
<section class="avaliacoes">
    <h2>O que nossos clientes dizem</h2>
    <div class="feedback">
        <p>"Ótimos preços e entrega super rápida! Recomendo!" - <strong>Maria S.</strong></p>
        <p>"Qualidade excelente, super confiável!" - <strong>João P.</strong></p>
    </div>
</section>

<!-- Rodapé -->
<footer class="footer">
    <p>&copy; 2025 Loja Alijoz. Todos os direitos reservados.</p>
</footer>

<script>
    // Carrossel
    let slideIndex = 0;
    showSlides();

    function showSlides() {
        let slides = document.querySelectorAll(".slides img");
        for (let i = 0; i < slides.length; i++) {
            slides[i].classList.remove("active");
        }
        slideIndex++;
        if (slideIndex > slides.length) { slideIndex = 1 }
        slides[slideIndex - 1].classList.add("active");
        setTimeout(showSlides, 5000);
    }

    function moveSlide(n) {
        let slides = document.querySelectorAll(".slides img");
        slideIndex += n;
        if (slideIndex > slides.length) { slideIndex = 1 }
        if (slideIndex < 1) { slideIndex = slides.length }
        slides[slideIndex - 1].classList.add("active");
    }
</script>

</body>
</html>
