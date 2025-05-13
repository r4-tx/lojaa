<%
    String tipo = (String) session.getAttribute("tipo");
    if (tipo == null || !tipo.equals("admin")) {
        response.sendRedirect("acessoNegado.jsp");
        return;
    }
%>



<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestão de Produtos</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/produtos.css">
</head>
<body>
    <div class="container">
        <!-- Botão Voltar -->
        <a href="index.jsp" class="btn-voltar">Voltar</a>

        <h2>Lista de Produtos</h2>

        <c:choose>
            <c:when test="${empty produtos}">
                <div class="alert alert-danger">Nenhum produto cadastrado.</div>
            </c:when>
            <c:otherwise>
                <div class="table-container">
                    <div class="table-responsive">
                        <table>
                            <thead>
                                <tr>
                                    <th>Nome</th>
                                    <th>Descrição</th>
                                    <th>Preço</th>
                                    <th>Quantidade</th>
                                    <th>Ações</th>
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
                                            <form action="produtos" method="post" onsubmit="return confirm('Deseja remover este produto?');">
                                                <input type="hidden" name="acao" value="remover">
                                                <input type="hidden" name="id" value="${p.id}">
                                                <button type="submit" class="btn-remover">Remover</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

        <h2>Cadastrar Produto</h2>

        <div class="form-container">
            <form action="produtos" method="post" id="form-cadastro">
                <div class="form-group">
                    <label for="nome">Nome do Produto</label>
                    <input type="text" id="nome" name="nome" required>
                </div>

                <div class="form-group">
                    <label for="descricao">Descrição</label>
                    <input type="text" id="descricao" name="descricao" required>
                </div>

                <div class="form-group">
                    <label for="preco">Preço (R$)</label>
                    <input type="number" id="preco" name="preco" step="0.01" min="0.01" required>
                </div>

                <div class="form-group">
                    <label for="quantidade">Quantidade em Estoque</label>
                    <input type="number" id="quantidade" name="quantidade" min="1" required>
                </div>

                <input type="submit" value="Cadastrar Produto">
            </form>
        </div>

        <!-- Mensagens -->
        <c:if test="${not empty sucesso}">
            <div class="alert alert-success">${sucesso}</div>
        </c:if>
        <c:if test="${not empty erro}">
            <div class="alert alert-danger">${erro}</div>
        </c:if>
    </div>

    <!-- Importando o JavaScript -->
    <script src="${pageContext.request.contextPath}/assets/js/produtos.js"></script>
</body>
</html>