<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastro - Loja Alijoz</title>

    <!-- CSS e fontes -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cadastro.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <!-- JS -->
    <script src="${pageContext.request.contextPath}/assets/js/cadastro.js" defer></script>
</head>
<body>

<!-- Navbar refinada -->
<header class="navbar">
    <div class="container">
        <div class="logo">
            <i class="fas fa-store" style="color:#0B5ED7;"></i>
            <span style="color:#000;">Loja</span><strong> Alijoz</strong>
        </div>
        <nav>
            <ul class="nav-links">
                <li><a href="index.jsp"><i class="fas fa-home"></i> Início</a></li>
                <li><a href="login.jsp"><i class="fas fa-arrow-left"></i> Voltar</a></li>
            </ul>
        </nav>
    </div>
</header>

<!-- Formulário de Cadastro -->
<main class="cadastro-container">
    <div class="cadastro-box">
        <h2><i class="fas fa-user-plus"></i> Cadastro de Novo Usuário</h2>
        <form action="cadastro" method="post" onsubmit="return validarFormulario()">
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input type="text" name="nome" id="nome" placeholder="Digite seu nome" required>
            </div>

            <div class="form-group">
                <label for="email">E-mail:</label>
                <input type="email" name="email" id="email" placeholder="Digite seu e-mail" required>
            </div>

            <div class="form-group">
                <label for="senha">Senha:</label>
                <input type="password" name="senha" id="senha" placeholder="Crie uma senha" required>
            </div>

            <div class="form-group">
                <label for="tipo">Tipo de Usuário:</label>
                <select name="tipo" id="tipo">
                    <option value="user">Usuário</option>
                    <option value="admin">Administrador</option>
                </select>
            </div>

            <button type="submit" class="btn-cadastrar">Cadastrar</button>
        </form>
    </div>
</main>

<!-- Rodapé -->
<footer class="footer">
    &copy; 2025 Loja Alijoz - Todos os direitos reservados.
</footer>

</body>
</html>
