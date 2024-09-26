<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, restaurante.restaurante, restaurante.restauranteDao" %>
<%
    restauranteDao restauranteDao = new restauranteDao();
    List<restaurante> restaurantes = restauranteDao.listar();
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lista de Restaurantes</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Lista de restaurantes</h2>
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>Nome</th>
                    <th>Endereço</th>
                    <th>Tipo de Culinária</th>
                    <th>Classificação</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (restaurante restaurante : restaurantes) {
                %>
                <tr>
                    <td><%= restaurante.getNome() %></td>
                    <td><%= restaurante.getEndereco() %></td>
                    <td><%= restaurante.getTipoDeCulinaria() %></td>
                    <td><%= restaurante.getRating() %></td>
                    <td>
                        <a href="formulario.jsp?nome=<%= restaurante.getNome() %>" class="btn btn-warning btn-sm">Editar</a>
                        <a href="excluir.jsp?nome=<%= restaurante.getNome() %>" class="btn btn-danger btn-sm">Excluir</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <a href="index.jsp" class="btn btn-secondary">Voltar</a>
    </div>
</body>
</html>
