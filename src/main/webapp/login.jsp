<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Login - Loja Alijoz</title>

    <!-- Estilos e ícones -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <!-- JavaScript de validação -->
    <script src="${pageContext.request.contextPath}/assets/js/login.js" defer></script>
</head>
<body>

<!-- Navbar Azul Profissional -->
<header class="navbar">
    <div class="container">
        <div class="logo">
            <i class="fas fa-store" style="color:#0B5ED7;"></i>
            <span style="color:#000;">Loja</span><strong> Alijoz</strong>
        </div>
        <nav>
            <ul class="nav-links">
                <li><a href="index.jsp"><i class="fas fa-home"></i> Início</a></li>
                <li><a href="javascript:history.back()"><i class="fas fa-arrow-left"></i> Voltar</a></li>
            </ul>
        </nav>
    </div>
</header>



<!-- Tela de Login -->
<main class="login-container">
    <div class="login-box">
        <h2><i class="fas fa-sign-in-alt"></i> Acesso à Conta</h2>
        <form action="login" method="post">
            <div class="form-group">
                <label for="usuario"><i class="fas fa-envelope"></i> Email:</label>
                <input type="text" id="usuario" name="email" placeholder="exemplo@email.com" required>
            </div>

            <div class="form-group">
                <label for="senha"><i class="fas fa-lock"></i> Senha:</label>
                <input type="password" id="senha" name="senha" placeholder="********" required>
            </div>

            <button type="submit" class="btn-login">Entrar</button>

            <div class="register-link">
                <p>Não tem uma conta? <a href="cadastro.jsp">Cadastre-se</a></p>
            </div>
        </form>
    </div>
</main>

<!-- Rodapé -->
<footer class="footer">
    &copy; 2025 Loja Alijoz - Todos os direitos reservados.
</footer>

</body>
</html>
