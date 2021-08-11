package br.com.antony.app.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.antony.app.model.Usuario;
import br.com.antony.app.service.UsuarioService;

@WebServlet("/logincontroller")
public class LoginController extends HttpServlet {
	
	private UsuarioService service = new UsuarioService();
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Usuario usuario = new Usuario();
		usuario.setEmail(request.getParameter("email"));
		usuario.setSenha(request.getParameter("senha"));
		
		boolean validaLogin = service.validarLogin(usuario);
		
		if(validaLogin) {
			RequestDispatcher view = request.getRequestDispatcher("/lista.jsp");
			request.setAttribute("usuarios", service.buscarTodos());
			view.forward(request, response);
		}
		else {
			RequestDispatcher view = request.getRequestDispatcher("/login.jsp");
			request.setAttribute("error", "Email ou senha inválido");
			view.forward(request, response);
		}
		
	}

}
