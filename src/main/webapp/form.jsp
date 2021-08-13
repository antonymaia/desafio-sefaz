<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Usuário</title>
<script type="text/javascript" src="js/form.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript">

	const urlParams = new URLSearchParams(window.location.search);

	const idParam = urlParams.get('usuarioId');
	const actionParam = urlParams.get('action');

	$(document).ready(
			function() {
				if (idParam != null) {
					console.log('idParam não é nulo');
					$.ajax({
						type : 'GET',
						dataType : 'json',
						data : {
							action : actionParam,
							usuarioId : idParam
						},
						cache : false,
						url : 'usuariocontroller',
						success : function(data) {
							if (data.usuario) {
								console.log('entrou no if');
								$('#id').val(data.usuario.id);
								$('#nome').val(data.usuario.nome);
								$('#email').val(data.usuario.email);
								$('#senha').val(data.usuario.senha);
								$('#dddTelefone1').val(
										data.usuario.telefones[0].ddd);
								$('#numeroTelefone1').val(
										data.usuario.telefones[0].numero);
								$('#tipoTelefone1').val(
										data.usuario.telefones[0].tipo);
								$('#dddTelefone2').val(
										data.usuario.telefones[1].ddd);
								$('#numeroTelefone2').val(
										data.usuario.telefones[1].numero);
								$('#tipoTelefone2').val(
										data.usuario.telefones[1].tipo);
							}
						}
					})
				}

				$('#btn').click(function() {
					console.log('entrou no click do botão');
					var id = $('#id').val();
					var nome = $('#nome').val();
					var email = $('#email').val();
					var senha = $('#senha').val();
					var dddTelefone1 = $('#dddTelefone1').val();
					var numeroTelefone1 = $('#numeroTelefone1').val();
					var tipoTelefone1 = $('#tipoTelefone1').val();
					var dddTelefone2 = $('#dddTelefone2').val();
					var numeroTelefone2 = $('#numeroTelefone2').val();
					var tipoTelefone2 = $('#tipoTelefone2').val();

					$.ajax({
						type : 'POST',
						dataType : 'json',
						data : {
							id : id,
							nome : nome,
							email : email,
							senha : senha,
							dddTelefone1 : dddTelefone1,
							numeroTelefone1 : numeroTelefone1,
							tipoTelefone1 : tipoTelefone1,
							dddTelefone2 : dddTelefone2,
							numeroTelefone2 : numeroTelefone2,
							tipoTelefone2 : tipoTelefone2
						},
						cache : false,
						url : 'usuariocontroller'
					}).done(function(response) {
						window.location.href = "lista.jsp";
					}).fail(function(xhr, status, errorThrown) {
						alert("Error: " + xhr.responseText);
					})
				})
			})
</script>
</head>
<body>
	<h3>Cadastro de Usuário</h3>
	<table>
		<tr>
			<td>ID:</td>
			<td>
				<input id="id" type="text" value="${usuario.id}"readonly="readonly" width="20px" />
			</td>
		</tr>
		<tr>
			<td>NOME:</td>
			<td>
				<input id="nome" type="text" value="${usuario.nome}" required="required" />
			</td>
		</tr>
		<tr>
			<td>EMAIL:</td>
			<td>
				<input id="email" type="email" value="${usuario.email}" required="required"/>
			</td>
		</tr>
		<tr>
			<td>SENHA:</td>
			<td>
				<input id="senha" type="password" value="${usuario.senha}" required="required"/>
			</td>
		</tr>
		<tr>
			<td>TELEFONE 1:</td>
			<td>
				<input
					id="dddTelefone1"
					type="text" 
					value="${usuario.telefones[0].ddd}"
					placeholder="DDD"
					maxlength="2"
				 />
				 <input
				 	id="numeroTelefone1"
				 	type="text" 
				 	maxlength="9"
				 	value="${usuario.telefones[0].numero}"
					placeholder="Número" required="required"
				 />
				 <label for="tipoTelefone1">Tipo:</label>
				 <select id="tipoTelefone1" id="tipoTelefone1" value="${usuario.telefones[0].tipo}">
					<option value="fixo">FIXO</option>
					<option value="movel">MOVEL</option>
			</select></td>
		</tr>
		<tr>
			<td>TELEFONE 2:</td>
			<td>
				<input
					id="dddTelefone2"
					type="text"
					maxlength="2"
					value="${usuario.telefones[1].ddd}"
					placeholder="DDD"
				/>
				<input
					id="numeroTelefone2"
					type="text"
					maxlength="9"
					value="${usuario.telefones[1].numero}"
					placeholder="Número"
				/>
				<label for="tipoTelefone2">Tipo:</label>
				<select id="tipoTelefone2" id="tipoTelefone2" value="${usuario.telefones[1].tipo}">
					<option value="fixo">FIXO</option>
					<option value="movel">MOVEL</option>
			</select></td>
		</tr>
	</table>
	<input type="button" value="SALVAR" id="btn"/>
</body>
</html>