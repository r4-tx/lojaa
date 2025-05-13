package com.mave.loja.controler;

import com.mave.loja.dao.UsuarioDAO;
import com.mave.loja.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/cadastro")
public class CadastroServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nome = req.getParameter("nome");
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");
        String tipo = req.getParameter("tipo"); // user ou admin

        Usuario novoUsuario = new Usuario();
        novoUsuario.setNome(nome);
        novoUsuario.setEmail(email);
        novoUsuario.setSenha(senha);
        novoUsuario.setTipo(tipo);

        UsuarioDAO dao = new UsuarioDAO();
        boolean sucesso = dao.salvar(novoUsuario);

        if (sucesso) {
            resp.sendRedirect("login.jsp");
        } else {
            req.setAttribute("erro", "Erro ao cadastrar. Tente novamente.");
            req.getRequestDispatcher("cadastro.jsp").forward(req, resp);
        }
    }
}
