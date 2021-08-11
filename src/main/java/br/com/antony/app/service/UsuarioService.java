package br.com.antony.app.service;

import java.util.List;

import br.com.antony.app.dao.UsuarioDao;
import br.com.antony.app.model.Usuario;

public class UsuarioService {
	private UsuarioDao dao = new UsuarioDao();

	public void cadastrar(Usuario usuario) {
		try {
			if(dao.buscarPorEmail(usuario) != null) {
				throw new Exception("Email já utilizado!");
			}else {
				dao.cadastrar(usuario);
			}
		} catch (Exception e) {
			System.out.println("Erro ao cadastrar Usuário \n Erro: " + e.getMessage());
		}
	}

	public List<Usuario> buscarTodos() {
		List<Usuario> usuarios;
		usuarios = dao.buscarTodos();
		return usuarios;
	}

	public Usuario buscarPorId(int id) {
		Usuario usuario = dao.buscarPorId(id);
		return usuario;
	}

	public void atualizar(Usuario usuario) {
		dao.atualizar(usuario);
	}

	public void deletar(int id) {
		dao.deletar(id);
	}

	public boolean validarLogin(Usuario usuarioLogin) {
		Usuario usuarioBusca = dao.buscarPorEmail(usuarioLogin);
		if (usuarioBusca != null) {
			if (usuarioLogin.getEmail().equalsIgnoreCase(usuarioBusca.getEmail())) {
				if (usuarioLogin.getSenha().equalsIgnoreCase(usuarioBusca.getSenha())) {
					return true;
				}
			}
		}
		return false;
	}
}
