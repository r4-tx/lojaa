package com.mave.loja.dao;

import com.mave.loja.model.Produto;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ProdutoDAO {

    // Lista de produtos simulando um banco de dados
    private static final List<Produto> produtos = Collections.synchronizedList(new ArrayList<>());

    static {
        produtos.add(new Produto(1, "iPhone 16", "Novo iPhone 16 com tecnologia avançada.", 7999.00, 10));
        produtos.add(new Produto(2, "Motorola EDGE", "Motorola EDGE com excelente desempenho.", 4899.00, 20));
        produtos.add(new Produto(3, "Samsung S25 ULTRA", "Samsung S25 ULTRA com câmera de alta resolução.", 7499.00, 15));

        produtos.add(new Produto(4, "Produto 1", "Descrição do Produto 1", 10.0, 50));
        produtos.add(new Produto(5, "Produto 2", "Descrição do Produto 2", 20.0, 30));
        produtos.add(new Produto(6, "Produto 3", "Descrição do Produto 3", 30.0, 15));


    }

    // Busca um produto pelo ID
    public static Produto buscarPorId(int id) {
        synchronized (produtos) {
            return produtos.stream()
                    .filter(produto -> produto.getId() == id)
                    .findFirst()
                    .orElse(null);
        }
    }

    // Retorna a lista de produtos
    public static List<Produto> listarProdutos() {
        synchronized (produtos) {
            return new ArrayList<>(produtos); // Retorna uma cópia para evitar modificações diretas
        }
    }

    // Adiciona um novo produto à lista
    public static void adicionarProduto(Produto produto) {
        synchronized (produtos) {
            produtos.add(produto);
        }
    }

    // Remove um produto pelo ID
    public static boolean removerProduto(int id) {
        synchronized (produtos) {
            return produtos.removeIf(produto -> produto.getId() == id);
        }
    }

    // Atualiza um produto existente
    public static boolean atualizarProduto(Produto produtoAtualizado) {
        synchronized (produtos) {
            for (int i = 0; i < produtos.size(); i++) {
                if (produtos.get(i).getId() == produtoAtualizado.getId()) {
                    produtos.set(i, produtoAtualizado);
                    return true;
                }
            }
        }
        return false;
    }


    public static boolean diminuirQuantidade(int id, int quantidade) {
        synchronized (produtos) {
            for (Produto produto : produtos) {
                if (produto.getId() == id) {
                    if (produto.getQuantidade() >= quantidade) {
                        produto.setQuantidade(produto.getQuantidade() - quantidade);
                        return true;
                    }
                    return false; // Estoque insuficiente
                }
            }
        }
        return false; // Produto não encontrado
    }

    // ✅ Retorna a quantidade de um produto para o estoque após remoção do carrinho
    public static void retornarQuantidade(int id, int quantidade) {
        synchronized (produtos) {
            for (Produto produto : produtos) {
                if (produto.getId() == id) {
                    produto.setQuantidade(produto.getQuantidade() + quantidade);
                    break;
                }
            }
        }
    }
}
