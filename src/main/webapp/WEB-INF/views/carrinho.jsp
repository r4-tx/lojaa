<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Meu Carrinho - Loja Alijoz</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/carrinho.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/carrinho.js" defer></script>
</head>
<body>

<!-- Navbar moderna -->
<header class="navbar">
    <div class="container">
        <div class="logo">
            <i class="fas fa-store"></i> Loja <strong>Alijoz</strong>
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

<!-- Conteúdo -->
<main class="container">
    <h2>Meu Carrinho</h2>

    <c:choose>
        <c:when test="${empty sessionScope.carrinho}">
            <div class="alerta">Seu carrinho está vazio.</div>
        </c:when>
        <c:otherwise>
            <div class="tabela-carrinho">
                <table>
                    <thead>
                        <tr>
                            <th>Produto</th>
                            <th>Preço</th>
                            <th>Quantidade</th>
                            <th>Subtotal</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${sessionScope.carrinho}">
                            <tr>
                                <td>${item.produto.nome}</td>
                                <td>R$ ${item.produto.preco}</td>
                                <td>
                                    <div class="quantidade">
                                        <button onclick="alterarQuantidade(${item.produto.id}, -1)">−</button>
                                        <input type="number" id="qtd-${item.produto.id}" value="${item.quantidade}" min="1">
                                        <button onclick="alterarQuantidade(${item.produto.id}, 1)">+</button>
                                    </div>
                                </td>
                                <td>R$ ${item.produto.preco * item.quantidade}</td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/carrinho" method="post">
                                        <input type="hidden" name="acao" value="remover">
                                        <input type="hidden" name="produtoId" value="${item.produto.id}">
                                        <button type="submit" class="btn-remover">Remover</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="total">
                <strong>Total: R$ ${totalCarrinho}</strong>
            </div>
            <div class="finalizar-pedido">
                <c:if test="${not empty sessionScope.usuarioLogado}">
                    <a href="finalizarPedido.jsp" class="btn-finalizar">Finalizar Pedido</a>
                </c:if>
                <c:if test="${empty sessionScope.usuarioLogado}">
                    <div class="alerta-login">
                        Para finalizar o pedido, é necessário estar <strong>logado</strong>.
                        <a href="login.jsp" class="btn-entrar">Fazer Login</a>
                    </div>
                </c:if>
            </div>

        </c:otherwise>
    </c:choose>

    <form id="formAtualizarQtd" action="${pageContext.request.contextPath}/carrinho" method="post" style="display:none;">
        <input type="hidden" name="acao" value="atualizar">
        <input type="hidden" id="formProdutoId" name="produtoId">
        <input type="hidden" id="formQuantidade" name="quantidade">
    </form>

    <div class="acoes">
        <a href="${pageContext.request.contextPath}/produtos?view=lista" class="btn-voltar"><i class="fas fa-arrow-left"></i> Voltar à loja</a>
    </div>
</main>



</body>
</html>
