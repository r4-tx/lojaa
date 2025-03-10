<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.mave.loja.model.CarrinhoItem" %>

<%
    List<CarrinhoItem> carrinho = (List<CarrinhoItem>) session.getAttribute("carrinho");
    double totalCarrinho = (carrinho != null) ? carrinho.stream().mapToDouble(item -> item.getTotal()).sum() : 0;
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Carrinho - Loja Alijoz</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/carrinho.css">




    <script src="<%= request.getContextPath() %>/assets/js/carrinho.js" defer></script>
</head>
<body>

<h1>Seu Carrinho</h1>

<table>
    <thead>
        <tr>
            <th>Produto</th>
            <th>Quantidade</th>
            <th>Preço</th>
            <th>Total</th>
            <th>Ação</th>
        </tr>
    </thead>
    <tbody>
        <% if (carrinho != null && !carrinho.isEmpty()) {
            for (CarrinhoItem item : carrinho) { %>
                <tr>
                    <td><%= item.getProduto().getNome() %></td>
                    <td>
                        <input type="number" value="<%= item.getQuantidade() %>" onchange="atualizarQuantidade(<%= item.getProduto().getId() %>, this.value)">
                    </td>
                    <td>R$ <%= item.getProduto().getPreco() %></td>
                    <td>R$ <%= item.getTotal() %></td>
                    <td>
                        <button onclick="removerDoCarrinho(<%= item.getProduto().getId() %>)">Remover</button>
                    </td>
                </tr>
            <% }
        } else { %>
            <tr>
                <td colspan="5">Carrinho vazio</td>
            </tr>
        <% } %>
    </tbody>
</table>

<h2>Total: R$ <%= totalCarrinho %></h2>
<a href="<%= request.getContextPath() %>/pagamento.jsp" class="payment-btn">Ir para o pagamento</a>



</body>
</html>
