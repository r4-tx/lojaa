package com.mave.loja.dao;

import com.mave.loja.model.Produto;
import com.mave.loja.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class ProdutoDAO {

    public void salvar(Produto produto) {
        Transaction transacao = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transacao = session.beginTransaction();
            session.save(produto);
            transacao.commit();
        } catch (Exception e) {
            if (transacao != null) transacao.rollback();
            e.printStackTrace();
        }
    }

    // Listar todos os produtos
    public List<Produto> listarProdutos() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Produto", Produto.class).list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // ✅ Listar produtos em destaque
    public List<Produto> listarProdutosEmDestaque() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery(
                            "from Produto p where p.nome in (:nomes)", Produto.class)
                    .setParameterList("nomes", List.of(
                            "iPhone 16",
                            "Motorola EDGE",
                            "Samsung S25 ULTRA"
                    ))
                    .list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Buscar produto por ID
    public Produto buscarPorId(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Produto.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Atualizar produto
    public boolean atualizarProduto(Produto produtoAtualizado) {
        Transaction transacao = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transacao = session.beginTransaction();
            session.update(produtoAtualizado);
            transacao.commit();
            return true;
        } catch (Exception e) {
            if (transacao != null) transacao.rollback();
            e.printStackTrace();
            return false;
        }
    }

    // Remover produto por ID
    public boolean removerProduto(int id) {
        Transaction transacao = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Produto produto = session.get(Produto.class, id);
            if (produto != null) {
                transacao = session.beginTransaction();
                session.delete(produto);
                transacao.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            if (transacao != null) transacao.rollback();
            e.printStackTrace();
            return false;
        }
    }

    // Diminuir quantidade em estoque
    public boolean diminuirQuantidade(int id, int quantidade) {
        Transaction transacao = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Produto produto = session.get(Produto.class, id);
            if (produto != null && produto.getQuantidade() >= quantidade) {
                transacao = session.beginTransaction();
                produto.setQuantidade(produto.getQuantidade() - quantidade);
                session.update(produto);
                transacao.commit();
                return true;
            }
        } catch (Exception e) {
            if (transacao != null) transacao.rollback();
            e.printStackTrace();
        }
        return false;
    }

    // Retornar quantidade ao estoque
    public void retornarQuantidade(int id, int quantidade) {
        Transaction transacao = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Produto produto = session.get(Produto.class, id);
            if (produto != null) {
                transacao = session.beginTransaction();
                produto.setQuantidade(produto.getQuantidade() + quantidade);
                session.update(produto);
                transacao.commit();
            }
        } catch (Exception e) {
            if (transacao != null) transacao.rollback();
            e.printStackTrace();
        }
    }
}
