<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<style>
label{
	color: red;
}
</style>
<body>
	<form action="logincontroller" method="post">
		<h3>LOGIN</h3>
		<table>
			<tr>
				<td>EMAIL:</td>
				<td><input type="email" name="email" value="${usuario.email}" required="required"/></td>
			</tr>
			<tr>
				<td>SENHA:</td>
				<td><input type="password" name="senha" value="${usuario.senha}" required="required"/></td>
			</tr>
			<tr>
				<td><p><a href="/cadastro-usuario/form.jsp" >CADASTRAR-SE</a></p></td>
			</tr>
			<tr>
				<td><label><c:out value="${error}"/></label></td>
			</tr>
		</table>
		<input type="submit" value="Enviar" />
	</form>
</body>
</html>