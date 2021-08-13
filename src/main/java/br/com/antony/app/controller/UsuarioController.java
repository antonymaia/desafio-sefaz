package br.com.antony.app.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

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
		
		Map<String, Object> map = new HashMap<String, Object>();

		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("editar")) {
			String id = request.getParameter("usuarioId");
			Usuario usuario = service.buscarPorId(Integer.parseInt(id));
			map.put("usuario", usuario);
			write(response, map);
		}

		if (action.equalsIgnoreCase("lista")) {
			List<Usuario> usuarios =  service.buscarTodos();
			map.put("usuarios", usuarios);
			write(response, map);
		}
		if(action.equalsIgnoreCase("deletar")) {
			int id = Integer.parseInt(request.getParameter("usuarioId"));
			service.deletar(id);
		}
	}

	private void write(HttpServletResponse response, Map<String, Object> map) throws IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(new Gson().toJson(map));	
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
		
		if(id == null || id.equals("")) {
			Map<String, Object> map = new HashMap<String, Object>();
			try {
				service.cadastrar(usuario);
			} catch (Exception e) {
				response.setStatus(400);
				response.getWriter().write(e.getMessage());
			}
			write(response, map);
		}else {
			Map<String, Object> map = new HashMap<String, Object>();
			usuario.setId(Integer.parseInt(id));
			try {
				service.atualizar(usuario);
			} catch (Exception e) {
				response.setStatus(400);
				response.getWriter().write(e.getMessage());
			}
			write(response, map);
		}
	}
}