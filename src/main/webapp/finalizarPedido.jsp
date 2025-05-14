<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Finalizar Pedido</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2>Escolha a Forma de Pagamento</h2>
    <form action="confirmarPedido" method="post">
        <div class="form-check mt-3">
            <input class="form-check-input" type="radio" name="pagamento" id="cartao" value="Cartão" required>
            <label class="form-check-label" for="cartao">Cartão de Crédito</label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="pagamento" id="boleto" value="Boleto">
            <label class="form-check-label" for="boleto">Boleto Bancário</label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="pagamento" id="pix" value="PIX">
            <label class="form-check-label" for="pix">PIX</label>
        </div>
        <button type="submit" class="btn btn-success mt-4">Confirmar Pedido</button>
    </form>
    <a href="carrinho" class="btn btn-secondary mt-3">Voltar ao Carrinho</a>
</div>
</body>
</html>
