document.addEventListener("DOMContentLoaded", function () {
    const loginForm = document.querySelector("form");
    const usuarioInput = document.getElementById("usuario");
    const senhaInput = document.getElementById("senha");
    const erroMsg = document.createElement("p");

    // Adiciona classe de estilo para a mensagem de erro
    erroMsg.classList.add("error-message");

    // Verifica se há erro na URL
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has("erro")) {
        showError("Usuário ou senha incorretos!");
    }

    // Adiciona o evento de submit ao formulário
    loginForm.addEventListener("submit", function (event) {
        // Limpa mensagens de erro anteriores
        clearErrors();

        // Valida os campos
        const isUsuarioValid = validateField(usuarioInput, "Por favor, insira seu usuário.");
        const isSenhaValid = validateField(senhaInput, "Por favor, insira sua senha.");

        // Se algum campo for inválido, impede o envio do formulário
        if (!isUsuarioValid || !isSenhaValid) {
            event.preventDefault();
        }
    });

    // Função para validar um campo
    function validateField(field, errorMessage) {
        if (field.value.trim() === "") {
            field.classList.add("error");
            showError(errorMessage);
            return false;
        } else {
            field.classList.remove("error");
            return true;
        }
    }

    // Função para exibir mensagens de erro
    function showError(message) {
        erroMsg.textContent = message;
        loginForm.prepend(erroMsg);
    }

    // Função para limpar mensagens de erro e estilos
    function clearErrors() {
        erroMsg.textContent = "";
        usuarioInput.classList.remove("error");
        senhaInput.classList.remove("error");
    }
});