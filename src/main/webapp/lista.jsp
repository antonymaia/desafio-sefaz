<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<style type="text/css">
	.container{
		max-width: 980px;
		width: 100%;
		margin: auto;
	}
	.container p {
		padding: 5px 5px;
	}
	.container p a{
		text-decoration: none;
		text-transform: uppercase;
	}
	table{
		width: 100%;
		text-align: center;
	}
	th, td{
		padding: 5px 5px;
	}
	td{
		font-size: 12px;
		text-transform: uppercase;
	}
</style>
<body>
	<div class="container">
		<p><a href="/cadastro-usuario/login.jsp" >sair</a></p>
		<p><a href="/cadastro-usuario/form.jsp">Cadastrar</a></p>
		<table border="1">
			<thead>
				<tr>
					<th>ID</th>
					<th>NOME</th>
					<th>EMAIL</th>
					<th>TELEFONE1</th>
					<th>TELEFONE2</th>
					<th colspan = 2></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${usuarios}" var="usuario">
					<tr>
						<td><c:out value="${usuario.id}" /></td>
						<td><c:out value="${usuario.nome}" /></td>
						<td><c:out value="${usuario.email}" /></td>
						<td><c:out value="(${usuario.telefones[0].ddd})${usuario.telefones[0].numero} - ${usuario.telefones[0].tipo}" /></td>
						<td><c:out value="(${usuario.telefones[1].ddd})${usuario.telefones[1].numero} - ${usuario.telefones[1].tipo}" /></td>
						<td><a href = "usuariocontroller?action=editar&usuarioId=<c:out value="${usuario.id}"/>">EDITAR</a></td>
						<td><a href = "usuariocontroller?action=deletar&usuarioId=<c:out value="${usuario.id}"/>">DELETAR</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>