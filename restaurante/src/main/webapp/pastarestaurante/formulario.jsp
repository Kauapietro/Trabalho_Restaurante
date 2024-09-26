<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="restaurante.restaurante, restaurante.restauranteDao" %>
<%
    String nome = request.getParameter("nome");
    restaurante restaurante = null;

    if (nome != null) {
        // Se o nome existir na URL, o formulário está em modo de edição
        restauranteDao restauranteDao = new restauranteDao();
        restaurante = restauranteDao.buscarPorNome(nome);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title><%= (restaurante != null) ? "Editar Restaurante" : "Adicionar Restaurante" %></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2><%= (restaurante != null) ? "Editar Restaurante" : "Adicionar Restaurante" %></h2>
        <form action="gravar.jsp" method="post">
            <input type="hidden" name="originalNome" value="<%= (restaurante != null) ? restaurante.getNome() : "" %>">
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input type="text" class="form-control" name="nome" value="<%= (restaurante != null) ? restaurante.getNome() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="endereco">Endereço:</label>
                <input type="text" class="form-control" name="endereco" value="<%= (restaurante != null) ? restaurante.getEndereco() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="tipoDeCulinaria">Tipo de Culinária:</label>
                <input type="text" class="form-control" name="tipoDeCulinaria" value="<%= (restaurante != null) ? restaurante.getTipoDeCulinaria() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="rating">Classificação (0 a 5):</label>
                <input type="number" class="form-control" name="rating" step="0.1" min="0" max="5" value="<%= (restaurante != null) ? restaurante.getRating() : "" %>" required>
            </div>
            <button type="submit" class="btn btn-primary"><%= (restaurante != null) ? "Atualizar" : "Salvar" %></button>
        </form>
    </div>
</body>
</html>
