package com.mave.loja.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/produtos.jsp", "/listaProdutos.jsp"})
public class AuthFilter implements Filter {
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        String tipo = (session != null) ? (String) session.getAttribute("tipo") : null;
        String uri = request.getRequestURI();

        if (uri.contains("produtos.jsp") && (tipo == null || !tipo.equals("admin"))) {
            response.sendRedirect("acessoNegado.jsp");
        } else if ((uri.contains("produtos.jsp") || uri.contains("listaProdutos.jsp")) && tipo == null) {
            response.sendRedirect("login.jsp");
        } else {
            chain.doFilter(req, res);
        }
    }
}