<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="restaurante.restauranteDao" scope="page" />
<jsp:useBean id="restaurante" class="restaurante.restaurante" scope="page" />

<html>
<head>
    <title>Lista de Restaurantes</title>
</head>
<body>
    <h1>Lista de Restaurantes</h1>
    <a href="formulario.jsp">Adicionar Restaurante</a>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Cidade</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <jsp:useBean id="lista" class="java.util.ArrayList" scope="page"/>
            <jsp:setProperty name="lista" property="*" value="${rdao.listar()}"/>
            <c:forEach var="restaurante" items="${lista}">
                <tr>
                    <td>${restaurante.id}</td>
                    <td>${restaurante.nome}</td>
                    <td>${restaurante.cidade}</td>
                    <td>
                        <a href="formulario.jsp?id=${restaurante.id}">Editar</a> | 
                        <a href="excluir.jsp?id=${restaurante.id}">Excluir</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
