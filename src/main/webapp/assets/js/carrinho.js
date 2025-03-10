function adicionarAoCarrinho(produtoId, nome, preco) {
    fetch('carrinho', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: `acao=adicionar&produtoId=${produtoId}&quantidade=1`
    }).then(() => {
        alert(`${nome} adicionado ao carrinho!`);
        window.location.href = 'carrinho';
    });
}

function removerDoCarrinho(produtoId) {
    fetch('carrinho', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: `acao=remover&produtoId=${produtoId}`
    }).then(() => {
        window.location.reload();
    });
}

function atualizarQuantidade(produtoId, quantidade) {
    if (quantidade < 1) {
        removerDoCarrinho(produtoId);
        return;
    }
    fetch('carrinho', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: `acao=atualizar&produtoId=${produtoId}&quantidade=${quantidade}`
    }).then(() => {
        window.location.reload();
    });
}
