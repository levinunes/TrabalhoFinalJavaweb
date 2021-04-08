package br.edu.ifce.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.edu.ifce.model.Cliente;

public class ClienteDao {

	private static final EntityManagerFactory factory = Persistence.createEntityManagerFactory("TJW");

	public static EntityManager getEntityManager() {
		return factory.createEntityManager();
	}

	public Cliente salvar(Cliente cliente) {
		EntityManager manager = getEntityManager();
		manager.getTransaction().begin();
		cliente = manager.merge(cliente);
		manager.getTransaction().commit();
		return cliente;
	}

	public Cliente consultarPorId(Long id) {
		EntityManager manager = getEntityManager();
		return manager.find(Cliente.class, id);
	}

	public void excluir(Cliente cliente) {
		EntityManager manager = getEntityManager();
		manager.getTransaction().begin();
		manager.remove(cliente);
		manager.getTransaction().commit();
	}

}
