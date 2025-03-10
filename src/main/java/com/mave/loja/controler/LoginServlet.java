package com.mave.loja.controler; // Corrigido "controler" para "controller"

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login") // Define explicitamente a URL do servlet
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");

        // Simulação de autenticação (substitua por um banco de dados real)
        if ("admin".equals(usuario) && "1234".equals(senha)) {
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogado", usuario);
            response.sendRedirect("indexum.jsp"); // Redireciona para a página inicial
        } else {
            // Adiciona uma mensagem de erro e retorna para a página de login
            request.setAttribute("erro", "Usuário ou senha incorretos");
            request.getRequestDispatcher("login.jsp").forward(request, response); // Alterado para login.jsp
        }
    }
}