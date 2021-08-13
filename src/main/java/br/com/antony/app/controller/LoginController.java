package br.com.antony.app.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import br.com.antony.app.model.Usuario;
import br.com.antony.app.service.UsuarioService;

@WebServlet("/logincontroller")
public class LoginController extends HttpServlet {

	private UsuarioService service = new UsuarioService();
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Usuario usuario = new Usuario();
		usuario.setEmail(request.getParameter("email"));
		usuario.setSenha(request.getParameter("senha"));

		Map<String, Object> map = new HashMap<String, Object>();
		boolean validaLogin = service.validarLogin(usuario);
		String error = "";
		if (validaLogin == false) {
			error = "Email ou senha inválido";
		}
		map.put("validaLogin", validaLogin);
		map.put("error", "Email ou senha inválido");
		write(response, map);
	}

	private void write(HttpServletResponse response, Map<String, Object> map) throws IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(new Gson().toJson(map));
	}

}
