package com.mave.loja.controler;

import com.mave.loja.dao.ProdutoDAO;
import com.mave.loja.model.CarrinhoItem;
import com.mave.loja.model.Produto;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/carrinho")
public class CarrinhoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CarrinhoItem> carrinho = obterCarrinho(session);

        double total = calcularTotalCarrinho(carrinho);
        request.setAttribute("totalCarrinho", total);

        request.getRequestDispatcher("/WEB-INF/views/carrinho.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("[DEBUG] POST /carrinho acionado");

        HttpSession session = request.getSession();
        List<CarrinhoItem> carrinho = obterCarrinho(session);

        String acao = request.getParameter("acao");
        String produtoIdParam = request.getParameter("produtoId");
        String quantidadeParam = request.getParameter("quantidade");

        System.out.println("[DEBUG] acao = " + acao);
        System.out.println("[DEBUG] produtoIdParam = " + produtoIdParam);
        System.out.println("[DEBUG] quantidadeParam = " + quantidadeParam);

        if (produtoIdParam == null || produtoIdParam.isEmpty()) {
            System.out.println("[ERRO] produtoIdParam é nulo ou vazio.");
            response.sendRedirect(request.getContextPath() + "/carrinho");
            return;
        }

        try {
            Long produtoId = Long.parseLong(produtoIdParam);

            if ("adicionar".equals(acao)) {
                int quantidade = (quantidadeParam != null && !quantidadeParam.isEmpty())
                        ? Integer.parseInt(quantidadeParam) : 1;
                adicionarProduto(carrinho, produtoId, quantidade);
            } else if ("remover".equals(acao)) {
                removerProduto(carrinho, produtoId);
            } else if ("atualizar".equals(acao)) {
                int quantidade = (quantidadeParam != null && !quantidadeParam.isEmpty())
                        ? Integer.parseInt(quantidadeParam) : 1;
                atualizarQuantidade(carrinho, produtoId, quantidade);
            }

            session.setAttribute("carrinho", carrinho);
        } catch (NumberFormatException e) {
            System.err.println("[ERRO] parâmetros inválidos: " + e.getMessage());
        }

        response.sendRedirect(request.getContextPath() + "/carrinho");
    }

    private List<CarrinhoItem> obterCarrinho(HttpSession session) {
        List<CarrinhoItem> carrinho = (List<CarrinhoItem>) session.getAttribute("carrinho");
        if (carrinho == null) {
            carrinho = new ArrayList<>();
            session.setAttribute("carrinho", carrinho);
        }
        return carrinho;
    }

    private void adicionarProduto(List<CarrinhoItem> carrinho, Long produtoId, int quantidade) {
        if (quantidade <= 0) return;

        System.out.println("[DEBUG] Adicionando produto ID: " + produtoId);

        ProdutoDAO produtoDAO = new ProdutoDAO();
        Produto produto = produtoDAO.buscarPorId(produtoId);

        if (produto == null) {
            System.out.println("[ERRO] Produto com ID " + produtoId + " não encontrado.");
            return;
        }

        System.out.println("[DEBUG] Produto encontrado: " + produto.getNome());

        for (CarrinhoItem item : carrinho) {
            if (item.getProduto().getId().equals(produtoId)) {
                item.setQuantidade(item.getQuantidade() + quantidade);
                System.out.println("[DEBUG] Quantidade atualizada para: " + item.getQuantidade());
                return;
            }
        }

        carrinho.add(new CarrinhoItem(produto, quantidade));
        System.out.println("[DEBUG] Produto adicionado ao carrinho: " + produto.getNome());
    }

    private void removerProduto(List<CarrinhoItem> carrinho, Long produtoId) {
        carrinho.removeIf(item -> item.getProduto().getId().equals(produtoId));
        System.out.println("[DEBUG] Produto removido do carrinho: ID " + produtoId);
    }

    private void atualizarQuantidade(List<CarrinhoItem> carrinho, Long produtoId, int quantidade) {
        if (quantidade <= 0) {
            removerProduto(carrinho, produtoId);
            return;
        }

        for (CarrinhoItem item : carrinho) {
            if (item.getProduto().getId().equals(produtoId)) {
                item.setQuantidade(quantidade);
                System.out.println("[DEBUG] Quantidade do produto ID " + produtoId + " atualizada para: " + quantidade);
                return;
            }
        }
    }

    private double calcularTotalCarrinho(List<CarrinhoItem> carrinho) {
        double total = 0.0;
        for (CarrinhoItem item : carrinho) {
            total += item.getProduto().getPreco() * item.getQuantidade();
        }
        return total;
    }
}
