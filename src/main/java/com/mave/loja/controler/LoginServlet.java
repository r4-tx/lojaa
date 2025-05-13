package com.mave.loja.controler;

import com.mave.loja.dao.UsuarioDAO;
import com.mave.loja.model.Usuario;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email").trim().toLowerCase();
        String senha = req.getParameter("senha").trim();

        System.out.println("Email recebido: " + email);
        System.out.println("Senha recebida: " + senha);

        UsuarioDAO dao = new UsuarioDAO();
        Usuario usuario = dao.buscarPorEmailSenha(email, senha);

        if (usuario != null) {
            HttpSession session = req.getSession();
            session.setAttribute("usuarioLogado", usuario.getNome());
            session.setAttribute("tipo", usuario.getTipo());

            // ✅ Redirecionamento conforme o tipo
            if ("admin".equals(usuario.getTipo())) {
                resp.sendRedirect("admin.jsp");
            } else {
                resp.sendRedirect("index.jsp");
            }
        } else {
            req.setAttribute("erro", "Login inválido");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
