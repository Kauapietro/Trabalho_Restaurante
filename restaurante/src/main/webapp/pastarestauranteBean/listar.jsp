<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="restaurante.restauranteDao" scope="page" />

<html>
<head>
    <title>Listar Restaurantes</title>
</head>
<body>
    <h1>Lista de Restaurantes</h1>
    <c:forEach var="restaurante" items="${rdao.listar()}">
        <p>${restaurante.nome} - ${restaurante.cidade}</p>
    </c:forEach>
</body>
</html>
