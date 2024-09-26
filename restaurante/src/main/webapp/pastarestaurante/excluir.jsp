<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="restaurante.restauranteDao" %>
<%
    String nome = request.getParameter("nome");
    restauranteDao restauranteDao = new restauranteDao();
    boolean excluidoComSucesso = false;

    if (nome != null && !nome.isEmpty()) {
        excluidoComSucesso = restauranteDao.excluir(nome);
    }

    // Redireciona para a página inicial ou para a página de listagem de restaurantes
    if (excluidoComSucesso) {
        response.sendRedirect("listar.jsp"); // Página para listar os restaurantes ou qualquer outra página
    } else {
        response.sendRedirect("erroExclusao.jsp"); // Página de erro em caso de falha
    }
%>