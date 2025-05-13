<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastro</title>

    <!-- CSS externo -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cadastro.css">

    <!-- JS externo -->
    <script src="${pageContext.request.contextPath}/assets/js/cadastro.js" defer></script>

    <!-- Ícones e fontes -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2><i class="fas fa-user-plus"></i> Cadastro de Novo Usuário</h2>
        <form action="cadastro" method="post" onsubmit="return validarFormulario()">
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input type="text" name="nome" id="nome" required>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" name="email" id="email" required>
            </div>

            <div class="form-group">
                <label for="senha">Senha:</label>
                <input type="password" name="senha" id="senha" required>
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
</body>
</html>
