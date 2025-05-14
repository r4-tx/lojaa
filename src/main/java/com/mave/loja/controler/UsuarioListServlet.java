package com.mave.loja.controler;

import com.mave.loja.dao.UsuarioDAO;
import com.mave.loja.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/usuarios")
public class UsuarioListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        UsuarioDAO dao = new UsuarioDAO();

        // Verifica se foi requisitada uma remoção
        String acao = req.getParameter("action");
        String idParam = req.getParameter("id");
        if ("remover".equals(acao) && idParam != null) {
            try {
                Long id = Long.parseLong(idParam);
                dao.deletar(id);
                resp.sendRedirect("usuarios");
                return;
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("erro", "Erro ao remover usuário.");
            }
        }

        List<Usuario> usuarios = dao.listarTodos();
        req.setAttribute("usuarios", usuarios);
        req.getRequestDispatcher("/WEB-INF/views/usuarios.jsp").forward(req, resp);
    }
}

