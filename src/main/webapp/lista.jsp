<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript">

	function deletar(id){
		$.ajax({
			type : 'GET',
			data : {
				action : 'deletar',
				usuarioId : id
			},
			url : 'usuariocontroller',
			cache :false,
			success : function(){
				location.reload();
			}
		})
	}
	$(document).ready(function(){
		console.log("documento carregado");
		
		$('td').click(function(){
			var col = $(this).parent().children().index($(this));
			var row = $(this).parent().parent().children().index($(this).parent());
			console.log('Row: ' + row + ', Column: ' + col);
		});
		
		$.ajax({
			type : 'GET',
			url : 'usuariocontroller?action=lista',
			cache : false,
			success : function(data){
				if(data.usuarios.length > 0){
					for (var i = 0; i < data.usuarios.length; i++){
						var tr = $("<tr/>");
						var tdId = $("<td>"+data.usuarios[i].id+"</td>");
						var tdNome = $("<td>"+data.usuarios[i].nome+"</td>");
						var tdEmail = $("<td>"+data.usuarios[i].email+"</td>");
						var tdTelefone1 = $("<td>("+data.usuarios[i].telefones[0].ddd+")"
										+data.usuarios[i].telefones[0].numero+" - "
										+data.usuarios[i].telefones[0].tipo+"</td>");
						var tdTelefone2 = $("<td>("+data.usuarios[i].telefones[1].ddd+")"
										+data.usuarios[i].telefones[1].numero+" - "
										+data.usuarios[i].telefones[1].tipo+"</td>");
						var tdEditar = $('<td><a href = "/cadastro-usuario/form.jsp?action=editar&usuarioId='
									+data.usuarios[i].id+'">EDITAR</a></td>');
						var tdRemover = $('<td><img src="img/lixeira.png" onclick="deletar('+data.usuarios[i].id+')"></img></td>');
						tr.append(tdId);
						tr.append(tdNome);
						tr.append(tdEmail);
						tr.append(tdTelefone1);
						tr.append(tdTelefone2);
						tr.append(tdEditar);
						tr.append(tdRemover);
						$("#corpoTabela").append(tr);
					}
				}
			}			
		})
	});
</script>
</head>
<style type="text/css">
.container {
	max-width: 980px;
	width: 100%;
	margin: auto;
}

.container p {
	padding: 5px 5px;
}

.container p a {
	text-decoration: none;
	text-transform: uppercase;
}

table {
	width: 100%;
	text-align: center;
}

th, td {
	padding: 5px 5px;
}

td {
	font-size: 12px;
	text-transform: uppercase;
}
</style>
<body>
	<div class="container">
		<p>
			<a href="/cadastro-usuario/login.jsp">sair</a>
		</p>
		<p>
			<a href="/cadastro-usuario/form.jsp">Cadastrar</a>
		</p>
		<table border="1">
			<thead>
				<tr>
					<th>ID</th>
					<th>NOME</th>
					<th>EMAIL</th>
					<th>TELEFONE1</th>
					<th>TELEFONE2</th>
					<th colspan=2></th>
				</tr>
			</thead>
			<tbody id="corpoTabela">
				<c:forEach items="${usuarios}" var="usuario">
					<tr>
						<td><c:out value="${usuario.id}" /></td>
						<td><c:out value="${usuario.nome}" /></td>
						<td><c:out value="${usuario.email}" /></td>
						<td><c:out
								value="(${usuario.telefones[0].ddd})${usuario.telefones[0].numero} - ${usuario.telefones[0].tipo}" /></td>
						<td><c:out
								value="(${usuario.telefones[1].ddd})${usuario.telefones[1].numero} - ${usuario.telefones[1].tipo}" /></td>
						<td><a
							href="usuariocontroller?action=editar&usuarioId=<c:out value="${usuario.id}"/>">EDITAR</a></td>
						<td><a
							href="usuariocontroller?action=deletar&usuarioId=<c:out value="${usuario.id}"/>">DELETAR</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>