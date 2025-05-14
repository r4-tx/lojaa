package com.mave.loja.dao;

import com.mave.loja.model.Usuario;
import com.mave.loja.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class UsuarioDAO {

    // Método para salvar novo usuário (usado no cadastro)
    public boolean salvar(Usuario usuario) {
        Transaction transacao = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transacao = session.beginTransaction();
            session.save(usuario);
            transacao.commit();
            return true;
        } catch (Exception e) {
            if (transacao != null) transacao.rollback();
            e.printStackTrace();
            return false;
        }
    }

    // Método de login
    public Usuario buscarPorEmailSenha(String email, String senha) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Usuario where email = :email and senha = :senha", Usuario.class)
                    .setParameter("email", email)
                    .setParameter("senha", senha)
                    .uniqueResult();
        }
    }

    // Listar todos os usuários
    public List<Usuario> listarTodos() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Usuario", Usuario.class).list();
        }
    }

    // NOVO: Deletar usuário por ID
    public boolean deletar(Long id) {
        Transaction transacao = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Usuario usuario = session.get(Usuario.class, id);
            if (usuario == null) return false;

            transacao = session.beginTransaction();
            session.delete(usuario);
            transacao.commit();
            return true;
        } catch (Exception e) {
            if (transacao != null) transacao.rollback();
            e.printStackTrace();
            return false;
        }
    }


}
