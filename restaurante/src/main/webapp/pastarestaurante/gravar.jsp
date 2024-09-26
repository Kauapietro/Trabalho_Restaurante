<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="restaurante.restaurante, restaurante.restauranteDao" %>
<%
    String originalNome = request.getParameter("originalNome");
    String nome = request.getParameter("nome");
    String endereco = request.getParameter("endereco");
    String tipoDeCulinaria = request.getParameter("tipoDeCulinaria");
    int rating = Integer.parseInt(request.getParameter("rating"));

    restauranteDao restauranteDao = new restauranteDao();

    if (originalNome != null && !originalNome.isEmpty()) {
        // Edição do restaurante existente
        restaurante restauranteEditado = new restaurante(nome, endereco, tipoDeCulinaria, rating);
        restauranteDao.editar(originalNome, restauranteEditado);
    } else {
        // Adição de um novo restaurante
        restaurante novoRestaurante = new restaurante(nome, endereco, tipoDeCulinaria, rating);
        restauranteDao.adicionar(novoRestaurante);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Restaurante Gravado</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5 text-center">
        <h2>Restaurante <%= (originalNome != null && !originalNome.isEmpty()) ? "atualizado" : "adicionado" %> com sucesso!</h2>
        <a href="listar.jsp" class="btn btn-success">Ver lista de restaurantes</a>
        <a href="index.jsp" class="btn btn-secondary">Voltar</a>
    </div>
</body>
</html>
