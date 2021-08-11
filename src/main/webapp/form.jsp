<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Usuário</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
	<form action="usuariocontroller" method="post">
		<h3>Cadastro de Usuário</h3>
		<table>
			<tr>
				<td>ID:</td>
				<td><input type="text" name="id" value="${usuario.id}" readonly="readonly" width="20px"/></td>
			</tr>
			<tr>
				<td>NOME:</td>
				<td><input type="text" name="nome" value="${usuario.nome}" required="required"/></td>
			</tr>
			<tr>
				<td>EMAIL:</td>
				<td><input type="email" name="email" value="${usuario.email}" required="required"/></td>
			</tr>
			<tr>
				<td>SENHA:</td>
				<td><input type="password" name="senha" value="${usuario.senha}" required="required"/></td>
			</tr>
			<tr>
				<td>TELEFONE 1:</td>
				<td>
					<input type="number" name="dddTelefone1" value="${usuario.telefones[0].ddd}" placeholder="DDD" required="required" maxlength="3"/>
					<input type="number" name="numeroTelefone1" value="${usuario.telefones[0].numero}" placeholder="Número" required="required" maxlength ="9"/> 
					<label for="tipoTelefone1">Tipo:</label>
					<select name="tipoTelefone1" id="tipoTelefone1" value = "${usuario.telefones[0].tipo}">
						<option value="fixo">FIXO</option>
						<option value="movel">MOVEL</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>TELEFONE 2:</td>
				<td>
					<input type="number" name="dddTelefone2" value="${usuario.telefones[1].ddd}" placeholder="DDD" maxlength ="3"/>
					<input type="number" name="numeroTelefone2" value="${usuario.telefones[1].numero}" placeholder="Número" required="required" maxlength ="9"/>
					<label for="tipoTelefone2">Tipo:</label> 
					<select name="tipoTelefone2" id="tipoTelefone2" value = "${usuario.telefones[1].tipo}">
						<option value="fixo">FIXO</option>
						<option value="movel">MOVEL</option>
					</select>
				</td>
			</tr>
		</table>
		<input type="submit" value="Enviar" />
	</form>
	<script>
		$("#tipoTelefone1>option[value=${usuario.telefones[0].tipo}]").attr("selected", true);
		$("#tipoTelefone2>option[value=${usuario.telefones[1].tipo}]").attr("selected", true);
	</script>
</body>
</html>