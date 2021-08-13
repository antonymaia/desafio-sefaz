<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#btnEntrar').click(function() {
			var email = $('#email').val();
			var senha = $('#senha').val();
			$.ajax({
				type : 'POST',
				dataType : 'json',
				data : {
					email : email,
					senha : senha
				},
				url : 'logincontroller',
				success : function(data) {
					if (data.validaLogin == true) {
						window.location.replace("lista.jsp");
					} else {
						var error = data.error
						$('#error').html(error);
					}
				}
			})
		})
	});
</script>
</head>
<style>
span {
	color: red;
}
</style>
<body>
	<h3>LOGIN</h3>
	<table>
		<tr>
			<td>EMAIL:</td>
			<td><input type="email" id="email" value="${usuario.email}"
				required="required" /></td>
		</tr>
		<tr>
			<td>SENHA:</td>
			<td><input type="password" id="senha" value="${usuario.senha}"
				required="required" /></td>
		</tr>
		<tr>
			<td><p>
					<a href="/cadastro-usuario/form.jsp">CADASTRAR-SE</a>
				</p></td>
		</tr>
		<tr>
			<td><span id="error"></span></td>
		</tr>
	</table>
	<input type="button" value="ENTRAR" id="btnEntrar" />
</body>
</html>