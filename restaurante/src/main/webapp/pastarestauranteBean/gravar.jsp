<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="restaurante.restauranteDao" scope="page" />
<jsp:useBean id="restaurante" class="restaurante.restaurante" scope="page" />

<jsp:setProperty property="*" name="restaurante" />

<%
    if (restaurante.getId() == null) {
        rdao.inserir(restaurante);
    } else {
        rdao.atualizar(restaurante);
    }
%>
<script>
    alert('Restaurante salvo com sucesso!');
    window.location = 'index.jsp';
</script>
