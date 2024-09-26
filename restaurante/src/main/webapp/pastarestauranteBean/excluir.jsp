<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="restaurante.restauranteDao" scope="page" />

<%
    String id = request.getParameter("id");
    rdao.excluir(Integer.parseInt(id));
%>
<script>
    alert('Restaurante excluído com sucesso!');
    window.location = 'index.jsp';
</script>
