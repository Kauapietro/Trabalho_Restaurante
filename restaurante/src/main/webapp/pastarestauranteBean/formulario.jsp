<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="restaurante.restauranteDao" scope="page" />
<jsp:useBean id="restaurante" class="restaurante.restaurante" scope="page" />

<jsp:setProperty property="*" name="restaurante" param="id"/>

<html>
<head>
    <title>Cadastro de Restaurante</title>
</head>
<body>
    <h1>Cadastro de Restaurante</h1>
    <form action="gravar.jsp" method="post">
        <input type="hidden" name="idrestaurante" value="${restaurante.id}" />
        <label>Nome:</label>
        <input type="text" name="nome" value="${restaurante.nome}" /><br/>
        <label>Cidade:</label>
        <input type="text" name="cidade" value="${restaurante.cidade}" /><br/>
        <button type="submit">Salvar</button>
    </form>
</body>
</html>
