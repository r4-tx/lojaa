package com.mave.loja.controler;

import com.mave.loja.dao.ProdutoDAO;
import com.mave.loja.model.Produto;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProdutoDAO dao = new ProdutoDAO();
        List<Produto> destaques = dao.listarProdutosEmDestaque();
        request.setAttribute("produtosDestaque", destaques);


        request.setAttribute("produtos", destaques);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
