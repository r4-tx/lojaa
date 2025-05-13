<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Acesso Negado</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f8f8;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .card {
            background-color: white;
            border-radius: 16px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
            padding: 40px;
            text-align: center;
            max-width: 400px;
        }

        .card h1 {
            color: #d32f2f;
            font-size: 24px;
            margin-bottom: 16px;
        }

        .card p {
            font-size: 16px;
            margin-bottom: 24px;
        }

        .btn-voltar {
            background-color: #00A656;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn-voltar:hover {
            background-color: #008749;
        }
    </style>
</head>
<body>

<div class="card">
    <h1>Acesso Negado</h1>
    <p>Esta área é restrita. Somente administradores podem acessá-la.</p>
    <a href="index.jsp" class="btn-voltar">Voltar ao Início</a>
</div>

</body>
</html>
