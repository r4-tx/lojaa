<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String erro = (String) request.getAttribute("erro");
    if (erro == null) {
        erro = "";
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Loja Alijoz</title>

    <!-- Estilos CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/login.css">

    <!-- Ícones e Fontes -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        /* Estilo global */
        html {
            direction: rtl; /* Faz a barra de rolagem aparecer no lado esquerdo */
        }

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: #e6f5ec;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            color: #333;
            overflow-x: hidden; /* Remove a barra de rolagem horizontal */
            direction: ltr; /* Mantém o conteúdo alinhado corretamente */
            padding-top: 70px; /* Espaço para a navbar aparecer corretamente */
            transition: padding-top 0.3s ease; /* Suaviza o efeito de transição */
        }

        /* Navbar */
        .navbar {
            width: 100%;
            background: #00A656;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 10;
            transition: top 0.3s; /* Suaviza o efeito de ocultação */
        }

        .navbar .logo {
            font-size: 22px;
            font-weight: 600;
        }

        .navbar .logo i {
            color: #FFD700;
            margin-right: 8px;
        }

        .navbar .logo span {
            color: #FFD700;
        }

        .nav-links {
            list-style: none;
            display: flex;
            gap: 20px;
            margin-right: 80px;
        }

        .nav-links a {
            text-decoration: none;
            color: white;
            font-weight: 500;
            transition: 0.3s;
        }

        .nav-links a:hover {
            color: #FFD700;
        }

        /* Login */
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 75vh;
        }

        .login-box {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 90%;
        }

        .login-box h2 {
            margin-bottom: 20px;
            color: #00A656;
            font-size: 24px;
        }

        /* Formulário */
        .form-group {
            display: flex;
            flex-direction: column;
            text-align: left;
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: 500;
            margin-bottom: 8px;
            color: #333;
        }

        .form-group input {
            padding: 12px;
            border: 1px solid #00A656;
            border-radius: 8px;
            font-size: 16px;
            background: #f9f9f9;
            color: #333;
            transition: 0.3s;
        }

        .form-group input:focus {
            border-color: #00A656;
            outline: none;
            box-shadow: 0 0 8px rgba(0, 166, 86, 0.5);
        }

        /* Botão de Login */
        .btn-login {
            background: #00A656;
            color: white;
            padding: 14px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            transition: 0.3s;
        }

        .btn-login:hover {
            background: #008749;
            transform: translateY(-2px);
        }

        /* Mensagem de erro */
        .error-message {
            color: #e74c3c;
            font-size: 14px;
            margin-top: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .error-message i {
            margin-right: 5px;
        }

        /* Link de cadastro */
        .register-link {
            margin-top: 20px;
            font-size: 14px;
        }

        .register-link a {
            color: #00A656;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        .register-link a:hover {
            text-decoration: underline;
            color: #008749;
        }

        /* Rodapé */
        .footer {
            margin-top: auto;
            width: 100%;
            text-align: center;
            padding: 15px;
            background: #00A656;
            color: white;
            font-size: 14px;
            box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <header class="navbar">
        <div class="logo">
            <a href="indexum.jsp" style="text-decoration: none; color: white;">
                <i class="fas fa-store"></i> Loja <span>Alijoz</span>
            </a>
        </div>
        <nav>
            <ul class="nav-links">
                <li><a href="index.jsp"><i class="fas fa-home"></i> Início</a></li>
                <li><a href="index.jsp"><i class="fas fa-arrow-left"></i> Voltar</a></li>
            </ul>
        </nav>
    </header>

    <!-- Seção de Login -->
    <section class="login-container">
        <div class="login-box">
            <h2>Login</h2>
            <form action="login" method="post">
                <div class="form-group">
                    <label for="email"><i class="fas fa-user"></i> E-mail:</label>
                    <input type="text" id="email" name="email" placeholder="Digite seu e-mail" required>
                </div>
                <div class="form-group">
                    <label for="senha"><i class="fas fa-lock"></i> Senha:</label>
                    <input type="password" id="senha" name="senha" placeholder="Digite sua senha" required>
                </div>
                <button type="submit" class="btn-login">Entrar</button>
                <% if (!erro.isEmpty()) { %>
                    <p class="error-message"><i class="fas fa-exclamation-circle"></i> <%= erro %></p>
                <% } %>
            </form>

            <p class="register-link">Ainda não tem uma conta? <a href="cadastro.jsp">Cadastre-se</a></p>
        </div>
    </section>

    <!-- Rodapé -->
    <footer class="footer">
        <p>&copy; 2025 Loja Alijoz. Todos os direitos reservados.</p>
    </footer>

    <script>
        let lastScrollTop = 0;
        const navbar = document.querySelector('.navbar');

        window.addEventListener('scroll', function() {
            let scrollTop = window.pageYOffset || document.documentElement.scrollTop;

            if (scrollTop > lastScrollTop) {
                navbar.style.top = "-70px";  // Esconde a navbar
            } else {
                navbar.style.top = "0";  // Mostra a navbar novamente
            }

            lastScrollTop = scrollTop <= 0 ? 0 : scrollTop; // Para não passar do topo
        });
    </script>

</body>
</html>
