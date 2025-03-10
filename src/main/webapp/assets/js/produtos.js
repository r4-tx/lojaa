// produtos.js

// Confirmação antes de cadastrar produto
document.querySelector('form').addEventListener('submit', function(event) {
    const nome = document.querySelector('input[name="nome"]').value;
    const preco = document.querySelector('input[name="preco"]').value;

    if (!nome || !preco) {
        alert("Preencha todos os campos obrigatórios.");
        event.preventDefault();
        return;
    }

    if (isNaN(preco) || parseFloat(preco) <= 0) {
        alert("O preço deve ser um valor numérico positivo.");
        event.preventDefault();
        return;
    }

    if (!confirm(`Deseja realmente cadastrar o produto "${nome}" por R$ ${parseFloat(preco).toFixed(2)}?`)) {
        event.preventDefault();
    }
});

// Efeito de foco nos inputs
const inputs = document.querySelectorAll('input[type="text"], input[type="number"]');
inputs.forEach(input => {
    input.addEventListener('focus', () => {
        input.style.borderColor = '#00BF63';
        input.style.boxShadow = '0 0 8px rgba(0,191,99,0.5)';
    });

    input.addEventListener('blur', () => {
        input.style.borderColor = '#ccc';
        input.style.boxShadow = 'none';
    });
});
