function validarFormulario() {
    const nome = document.getElementById('nome').value.trim();
    const email = document.getElementById('email').value.trim();
    const senha = document.getElementById('senha').value.trim();

    if (nome.length < 3) {
        alert('O nome deve ter pelo menos 3 caracteres.');
        return false;
    }

    if (!email.includes('@')) {
        alert('Digite um e-mail válido.');
        return false;
    }

    if (senha.length < 6) {
        alert('A senha deve ter pelo menos 6 caracteres.');
        return false;
    }

    return true; // tudo certo
}
