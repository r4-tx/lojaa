

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Meu Carrinho</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/carrinho.css">
    <script src="${pageContext.request.contextPath}/assets/js/carrinho.js" defer></script>
</head>
<body>
<div class="container">
    <h2>Meu Carrinho</h2>

    <c:choose>
        <c:when test="${empty sessionScope.carrinho}">
            <div class="alert">Seu carrinho está vazio.</div>
        </c:when>
        <c:otherwise>
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

            <div class="total">
                <strong>Total: R$ ${totalCarrinho}</strong>
            </div>
        </c:otherwise>
    </c:choose>

    <!-- Formulário oculto para atualizar quantidade via JS -->
    <form id="formAtualizarQtd" action="${pageContext.request.contextPath}/carrinho" method="post" style="display:none;">
        <input type="hidden" name="acao" value="atualizar">
        <input type="hidden" id="formProdutoId" name="produtoId">
        <input type="hidden" id="formQuantidade" name="quantidade">
    </form>

    <a href="${pageContext.request.contextPath}/produtos?view=lista" class="btn-voltar">Voltar à loja</a>
</div>
</body>
</html>
