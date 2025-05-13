/**
 * Altera a quantidade de um item no carrinho
 * @param {number} produtoId - ID do produto
 * @param {number} delta - valor a somar ou subtrair
 */
function alterarQuantidade(produtoId, delta) {
    const inputQtd = document.getElementById(`qtd-${produtoId}`);
    const novaQuantidade = parseInt(inputQtd.value) + delta;

    if (novaQuantidade >= 1) {
        inputQtd.value = novaQuantidade;
        atualizarQuantidade(produtoId);
    }
}

/**
 * Atualiza a quantidade via POST para o servlet
 * @param {number} produtoId 
 */
function atualizarQuantidade(produtoId) {
    const inputQtd = document.getElementById(`qtd-${produtoId}`);
    const quantidade = parseInt(inputQtd.value);

    if (isNaN(quantidade) || quantidade <= 0) {
        inputQtd.value = 1;
        return;
    }

    // Preencher o formulário oculto
    document.getElementById('formProdutoId').value = produtoId;
    document.getElementById('formQuantidade').value = quantidade;
    document.getElementById('formAtualizarQtd').submit();
}

/**
 * Exibe uma mensagem temporária no topo
 * @param {string} mensagem 
 */
function exibirMensagem(mensagem) {
    let mensagemEl = document.querySelector('.mensagem');

    if (!mensagemEl) {
        mensagemEl = document.createElement('div');
        mensagemEl.className = 'mensagem';
        const main = document.querySelector('main') || document.body;
        main.insertBefore(mensagemEl, main.firstChild);
    }

    mensagemEl.textContent = mensagem;
    mensagemEl.style.display = 'block';

    setTimeout(() => {
        mensagemEl.style.display = 'none';
    }, 3000);
}

// Validação ao sair do input manualmente
document.addEventListener('DOMContentLoaded', function () {
    const inputsQtd = document.querySelectorAll('input[type="number"]');
    inputsQtd.forEach(input => {
        input.addEventListener('blur', function () {
            if (this.value <= 0 || isNaN(parseInt(this.value))) {
                this.value = 1;
            }
        });
    });
});
