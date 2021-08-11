package br.com.antony.app.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.antony.app.model.Telefone;
import br.com.antony.app.model.Usuario;
import br.com.antony.app.service.UsuarioService;

@WebServlet("/usuariocontroller")
public class UsuarioController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private UsuarioService service;
	
	public UsuarioController() {
		super();
		service = new UsuarioService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String forward = "";
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("lista")) {
			request.setAttribute("usuarios", service.buscarTodos());
			forward = "/lista.jsp";
		}else if (action.equalsIgnoreCase("editar")) {
			int id = Integer.parseInt(request.getParameter("usuarioId"));
			Usuario usuario = service.buscarPorId(id);
			request.setAttribute("usuario", usuario);
			forward = "/form.jsp";
		}else if (action.equalsIgnoreCase("deletar")) {
			int id = Integer.parseInt(request.getParameter("usuarioId"));
			service.deletar(id);
			request.setAttribute("usuarios", service.buscarTodos());
			forward = "/lista.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Usuario usuario = new Usuario();
		
		String id = request.getParameter("id");
		usuario.setNome(request.getParameter("nome"));
		usuario.setEmail(request.getParameter("email"));
		usuario.setSenha(request.getParameter("senha"));

		Telefone telefone1 = new Telefone();
		telefone1.setDdd(Integer.parseInt(request.getParameter("dddTelefone1")));
		telefone1.setNumero(request.getParameter("numeroTelefone1"));
		telefone1.setTipo(request.getParameter("tipoTelefone1"));

		Telefone telefone2 = new Telefone();
		telefone2.setDdd(Integer.parseInt(request.getParameter("dddTelefone2")));
		telefone2.setNumero(request.getParameter("numeroTelefone2"));
		telefone2.setTipo(request.getParameter("tipoTelefone2"));

		List<Telefone> telefones = Arrays.asList(telefone1, telefone2);
		usuario.setTelefones(telefones);
		
		if(id == null || id.isEmpty()) {
			service.cadastrar(usuario);
		}else {
			usuario.setId(Integer.parseInt(id));
			service.atualizar(usuario);
		}
		RequestDispatcher view = request.getRequestDispatcher("/lista.jsp");
		List<Usuario> usuarios = service.buscarTodos();
		request.setAttribute("usuarios", usuarios);
		view.forward(request, response);
	}
}