document.addEventListener("DOMContentLoaded", function () {
    const filtro = document.getElementById("filtro");
    const linhas = document.querySelectorAll("#tabela-produtos tbody tr");

    filtro.addEventListener("input", function () {
        const termo = filtro.value.toLowerCase();

        linhas.forEach(linha => {
            const nome = linha.cells[0].textContent.toLowerCase();
            linha.style.display = nome.includes(termo) ? "" : "none";
        });
    });
});
