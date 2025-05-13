// produtos.js - Versão Atualizada

document.addEventListener('DOMContentLoaded', function() {
    // Formulário de cadastro
    const formCadastro = document.getElementById('form-cadastro');

    if (formCadastro) {
        formCadastro.addEventListener('submit', function(event) {
            // Obtenção dos valores
            const nome = document.getElementById('nome').value.trim();
            const descricao = document.getElementById('descricao').value.trim();
            const preco = document.getElementById('preco').value;
            const quantidade = document.getElementById('quantidade').value;

            // Validação dos campos
            if (!nome || !descricao || !preco || !quantidade) {
                event.preventDefault();
                showNotification('Preencha todos os campos obrigatórios.', 'error');
                return;
            }

            // Validação de valores numéricos
            if (isNaN(preco) || parseFloat(preco) <= 0) {
                event.preventDefault();
                showNotification('O preço deve ser um valor numérico positivo.', 'error');
                return;
            }

            if (isNaN(quantidade) || parseInt(quantidade) <= 0) {
                event.preventDefault();
                showNotification('A quantidade deve ser um valor inteiro positivo.', 'error');
                return;
            }

            // Confirmação antes do envio
            if (!confirm(`Confirmar cadastro do produto "${nome}" por R$ ${parseFloat(preco).toFixed(2)}?`)) {
                event.preventDefault();
            }
        });
    }

    // Efeito visual nos inputs
    const inputs = document.querySelectorAll('input[type="text"], input[type="number"]');

    inputs.forEach(input => {
        // Efeito de foco
        input.addEventListener('focus', function() {
            this.parentElement.classList.add('focused');
        });

        input.addEventListener('blur', function() {
            this.parentElement.classList.remove('focused');
        });

        // Validação em tempo real
        input.addEventListener('input', function() {
            validateInput(this);
        });
    });

    // Função para validação de input
    function validateInput(input) {
        if (input.hasAttribute('required') && input.value.trim() === '') {
            input.classList.add('invalid');
        } else if (input.type === 'number' && input.value !== '' && parseFloat(input.value) <= 0) {
            input.classList.add('invalid');
        } else {
            input.classList.remove('invalid');
        }
    }

    // Função para mostrar notificações
    function showNotification(message, type) {
        // Remove notificações anteriores
        const existingAlerts = document.querySelectorAll('.notification');
        existingAlerts.forEach(alert => alert.remove());

        // Cria nova notificação
        const notification = document.createElement('div');
        notification.className = `notification ${type === 'error' ? 'notification-error' : 'notification-success'}`;
        notification.textContent = message;

        // Adiciona ao DOM
        document.body.appendChild(notification);

        // Animação de entrada
        setTimeout(() => {
            notification.classList.add('show');
        }, 10);

        // Remove após alguns segundos
        setTimeout(() => {
            notification.classList.remove('show');
            setTimeout(() => {
                notification.remove();
            }, 300);
        }, 5000);
    }

    // Adiciona CSS dinâmico para notificações
    const styleElement = document.createElement('style');
    styleElement.textContent = `
        .notification {
            position: fixed;
            bottom: 20px;
            right: 20px;
            padding: 12px 20px;
            border-radius: 6px;
            color: white;
            font-weight: 500;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            transform: translateY(100px);
            opacity: 0;
            transition: all 0.3s ease;
            z-index: 1000;
            max-width: 350px;
        }

        .notification.show {
            transform: translateY(0);
            opacity: 1;
        }

        .notification-error {
            background-color: #e74c3c;
        }

        .notification-success {
            background-color: #00b894;
        }

        .form-group.focused label {
            color: #00b894;
        }

        input.invalid {
            border-color: #e74c3c !important;
            background-color: rgba(231, 76, 60, 0.05);
        }
    `;
    document.head.appendChild(styleElement);

    // Animação de entrada para os elementos da página
    const fadeElements = document.querySelectorAll('.table-container, .form-container, .alert');
    fadeElements.forEach((element, index) => {
        element.style.opacity = '0';
        element.style.transform = 'translateY(20px)';
        element.style.transition = 'opacity 0.3s ease, transform 0.3s ease';
        element.style.transitionDelay = `${index * 0.1}s`;

        setTimeout(() => {
            element.style.opacity = '1';
            element.style.transform = 'translateY(0)';
        }, 100);
    });
});