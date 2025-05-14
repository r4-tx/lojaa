document.addEventListener("DOMContentLoaded", () => {
    document.body.classList.add("fade-in");

    // Botões de adicionar ao carrinho
    document.querySelectorAll(".card-produto .btn").forEach(button => {
        button.addEventListener("click", function (e) {
            e.preventDefault();
            const produtoNome = this.closest(".card-produto").querySelector("h3").innerText;
            const produtoId = this.dataset.id || this.parentElement.querySelector("input[name='produtoId']")?.value;
            if (produtoId) {
                adicionarAoCarrinho(produtoNome, produtoId);
            }
        });
    });

    // Menu mobile toggle
    const menuToggle = document.querySelector(".menu-toggle");
    const navLinks = document.querySelector(".nav-links");

    if (menuToggle && navLinks) {
        menuToggle.addEventListener("click", () => {
            navLinks.classList.toggle("active");
        });

        document.addEventListener("click", (event) => {
            if (!navLinks.contains(event.target) && !menuToggle.contains(event.target)) {
                navLinks.classList.remove("active");
            }
        });
    }

    // Carrossel automático
    let slideIndex = 0;
    const showSlides = () => {
        const slides = document.querySelectorAll(".slides img");
        slides.forEach(slide => slide.classList.remove("active"));
        slideIndex = (slideIndex + 1 > slides.length) ? 1 : slideIndex + 1;
        if (slides[slideIndex - 1]) {
            slides[slideIndex - 1].classList.add("active");
        }
        setTimeout(showSlides, 5000);
    };
    showSlides();
});

// ✅ Corrigido: envia produtoId corretamente
function adicionarAoCarrinho(produtoNome, produtoId) {
    fetch("carrinho", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: `acao=adicionar&produtoId=${produtoId}&quantidade=1`
    })
    .then(response => {
        if (response.ok) {
            exibirNotificacao(`${produtoNome} adicionado ao carrinho!`);
        } else {
            exibirNotificacao(`Erro ao adicionar ${produtoNome}`, true);
        }
    })
    .catch(() => {
        exibirNotificacao(`Erro de conexão ao adicionar ${produtoNome}`, true);
    });
}

// Notificação tipo toast
function exibirNotificacao(mensagem, erro = false) {
    const toast = document.createElement("div");
    toast.className = "cart-notification";
    toast.style.backgroundColor = erro ? "#dc3545" : "#198754";
    toast.innerHTML = `<i class="fas ${erro ? 'fa-times-circle' : 'fa-check-circle'}"></i> ${mensagem}`;
    document.body.appendChild(toast);

    setTimeout(() => {
        toast.style.opacity = "0";
        setTimeout(() => toast.remove(), 500);
    }, 2500);
}

// Estilo visual direto no head
const style = document.createElement("style");
style.innerHTML = `
    .fade-in {
        opacity: 0;
        animation: fadeIn 0.8s ease-in-out forwards;
    }

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    .cart-notification {
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 12px 20px;
        color: white;
        font-size: 16px;
        border-radius: 6px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        z-index: 9999;
        transition: opacity 0.5s;
        display: flex;
        align-items: center;
        gap: 10px;
    }
`;
document.head.appendChild(style);
