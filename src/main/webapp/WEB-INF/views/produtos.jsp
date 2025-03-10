<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mave.loja.model.Produto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
    List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");

    // Check if produtos is null, create a new list if it is
    if (produtos == null) {
        produtos = new ArrayList<>();
    }

    // Check if the list is empty before adding products
    if (produtos.isEmpty()) {
        produtos.add(new Produto(1, "iPhone 16", "Celular", 7999.00, 14));
        produtos.add(new Produto(2, "Motorola EDGE", "Celular", 4899.00, 10));
        produtos.add(new Produto(3, "Samsung S25 ULTRA", "Celular", 7499.00, 7));
        request.setAttribute("produtos", produtos);
    }
%>

<!-- Importando o CSS -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/produtos.css">
<!-- Botão Voltar -->
<a href="index.jsp" class="btn-voltar">← Voltar</a>

<h2>Lista de Produtos</h2>

<table>
    <tr>
        <th>Nome</th>
        <th>Descrição</th>
        <th>Preço</th>
        <th>Quantidade</th>
    </tr>
    <% for (Produto p : produtos) { %>
        <tr>
            <td><%= p.getNome() %></td>
            <td><%= p.getDescricao() %></td>
            <td>R$ <%= String.format("%.2f", p.getPreco()) %></td>
            <td><%= p.getQuantidade() %></td>
        </tr>
    <% } %>
</table>

<h2>Cadastrar Produto</h2>
<form action="produtos" method="post">
    Nome: <input type="text" name="nome" required><br>
    Descrição: <input type="text" name="descricao" required><br>
    Preço: <input type="text" name="preco" required><br>
    Quantidade: <input type="number" name="quantidade" required><br>
    <input type="submit" value="Cadastrar">
</form>

<% if (request.getAttribute("erro") != null) { %>
    <p><%= request.getAttribute("erro") %></p>
<% } %>

<!-- Importando o JavaScript -->
<script src="<%= request.getContextPath() %>/assets/js/produtos.js"></script>