document.addEventListener("DOMContentLoaded", function () {
    const filtro = document.getElementById("filtro");
    const ordenar = document.getElementById("ordenar");
    const container = document.getElementById("produtos-container");

    const produtos = Array.from(container.getElementsByClassName("card-produto"));

    function atualizarFiltro() {
        const termo = filtro.value.toLowerCase();
        produtos.forEach(produto => {
            const nome = produto.dataset.nome.toLowerCase();
            produto.style.display = nome.includes(termo) ? "block" : "none";
        });
    }

    function ordenarProdutos() {
        const ordem = ordenar.value;
        const produtosOrdenados = [...produtos].sort((a, b) => {
            const precoA = parseFloat(a.dataset.preco);
            const precoB = parseFloat(b.dataset.preco);
            return ordem === "asc" ? precoA - precoB : precoB - precoA;
        });

        // Reanexa os elementos na nova ordem
        container.innerHTML = "";
        produtosOrdenados.forEach(produto => container.appendChild(produto));
        atualizarFiltro(); // reaplica filtro
    }

    filtro.addEventListener("input", atualizarFiltro);
    ordenar.addEventListener("change", ordenarProdutos);

    ordenarProdutos(); // ordena ao carregar
});
