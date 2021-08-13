package br.com.antony.app.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import br.com.antony.app.model.Usuario;
import br.com.antony.app.util.JPAUtil;

public class UsuarioDao {
	
	public void cadastrar(Usuario usuario) {
		EntityManager entityManager = JPAUtil.getEntityManager();
		entityManager.getTransaction().begin();
		entityManager.persist(usuario);
		entityManager.getTransaction().commit();
		entityManager.close();
	}
	
	public List<Usuario> buscarTodos(){
		EntityManager entityManager = JPAUtil.getEntityManager();
		entityManager.getTransaction().begin();
		String jpql = "SELECT u FROM Usuario u";
		List<Usuario> usuarios = entityManager.createQuery(jpql, Usuario.class).getResultList();
		entityManager.getTransaction().commit();
		entityManager.close();
		return usuarios;
	}
	
	public Usuario buscarPorId(int id){
		EntityManager entityManager = JPAUtil.getEntityManager();
		entityManager.getTransaction().begin();
		Usuario usuario = entityManager.find(Usuario.class, id);
		entityManager.getTransaction().commit();
		entityManager.close();
		return usuario;
	}

	public void atualizar(Usuario usuario) {
		EntityManager entityManager = JPAUtil.getEntityManager();
		entityManager.getTransaction().begin();
		entityManager.merge(usuario);
		entityManager.getTransaction().commit();
		entityManager.close();
	}

	public void deletar(int id) {
		EntityManager entityManager = JPAUtil.getEntityManager();
		entityManager.getTransaction().begin();
		
		Usuario usuario = entityManager.find(Usuario.class, id);
		entityManager.remove(usuario);
		
		entityManager.getTransaction().commit();
		entityManager.close();
	}

	public Usuario buscarPorEmail(Usuario usuario) {
		EntityManager entityManager = JPAUtil.getEntityManager();
		entityManager.getTransaction().begin();
		Usuario usuarioBuscar;
		String jpql = "SELECT u FROM Usuario u where u.email like '"+usuario.getEmail()+"'";
		try {
		usuarioBuscar = entityManager.createQuery(jpql, Usuario.class)
												.getSingleResult();
		entityManager.getTransaction().commit();
		entityManager.close();
		}catch(NoResultException e) {
			return null;
		}finally {
			entityManager.close();
		}
		return usuarioBuscar;
	}

}