package com.mave.loja.controler;

import com.mave.loja.dao.ProdutoDAO;
import com.mave.loja.model.Produto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/produtos")
public class ProdutoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProdutoDAO dao = new ProdutoDAO();
        List<Produto> produtos = dao.listarProdutos();
        request.setAttribute("produtos", produtos);

        String view = request.getParameter("view");

        if ("lista".equals(view)) {
            request.getRequestDispatcher("/WEB-INF/views/listaProdutos.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/views/produtos.jsp").forward(request, response);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");

        if ("remover".equals(acao)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                ProdutoDAO dao = new ProdutoDAO();
                boolean sucesso = dao.removerProduto(id);
                if (sucesso) {
                    request.setAttribute("sucesso", "Produto removido com sucesso!");
                } else {
                    request.setAttribute("erro", "Erro ao remover o produto.");
                }
            } catch (Exception e) {
                request.setAttribute("erro", "ID inválido.");
            }
            doGet(request, response);
            return;
        }

        try {
            String nome = request.getParameter("nome");
            String descricao = request.getParameter("descricao");
            String precoStr = request.getParameter("preco");
            String quantidadeStr = request.getParameter("quantidade");

            if (nome == null || nome.trim().isEmpty() ||
                    descricao == null || descricao.trim().isEmpty() ||
                    precoStr == null || precoStr.trim().isEmpty() ||
                    quantidadeStr == null || quantidadeStr.trim().isEmpty()) {
                throw new IllegalArgumentException("Todos os campos são obrigatórios.");
            }

            double preco = Double.parseDouble(precoStr);
            int quantidade = Integer.parseInt(quantidadeStr);

            if (preco < 0 || quantidade < 0) {
                throw new IllegalArgumentException("Preço e quantidade devem ser valores positivos.");
            }

            Produto produto = new Produto(nome, descricao, preco, quantidade);
            ProdutoDAO dao = new ProdutoDAO();
            dao.salvar(produto);
            request.setAttribute("sucesso", "Produto cadastrado com sucesso!");

            doGet(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("erro", "Preço e quantidade devem ser números válidos.");
            request.getRequestDispatcher("/WEB-INF/views/produtos.jsp").forward(request, response);
        } catch (IllegalArgumentException e) {
            request.setAttribute("erro", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/produtos.jsp").forward(request, response);
        }
    }
}
