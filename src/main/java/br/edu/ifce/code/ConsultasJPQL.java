package br.edu.ifce.code;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import br.edu.ifce.dao.ClienteDao;
import br.edu.ifce.model.Cliente;
import br.edu.ifce.model.Endereco;
import br.edu.ifce.model.Telefone;

public class ConsultasJPQL {
	private static final EntityManagerFactory factory = Persistence.createEntityManagerFactory("TJW");

	public static EntityManager getEntityManager() {
		return factory.createEntityManager();
	}

	public static List<Cliente> consulta_inicial(EntityManager manager) {
		String jpql = "select c from Cliente c order by c.nome";
		TypedQuery<Cliente> consulta = manager.createQuery(jpql, Cliente.class);
		return consulta.getResultList();
	}

	public static void populardb(EntityManager manager) throws IOException {
		manager.getTransaction().begin();

		Endereco endereco1 = new Endereco();
		endereco1.setLogradouro("Av. Carapinima");
		endereco1.setNumero("2200");
		endereco1.setCidade("Fortaleza");
		endereco1.setCep("60015290");
		endereco1.setEstado("Ceará");
		endereco1.setEnderecocol("-");
		manager.persist(endereco1);

		Endereco endereco2 = new Endereco();
		endereco2.setLogradouro("Avenida Dom Luís");
		endereco2.setNumero("500");
		endereco2.setCidade("Fortaleza");
		endereco2.setCep("60160230");
		endereco2.setEstado("Ceará");
		endereco2.setEnderecocol("-");
		manager.persist(endereco2);

		Telefone telefone = new Telefone();
		telefone.setTelefone("8534581212");
		manager.persist(telefone);

		manager.getTransaction().commit();
		
		Cliente cliente = new Cliente();
		cliente.setNome("João das Neves");
		cliente.setDtnascimento(LocalDate.of(1998, 10, 12));
		cliente.getEnderecos().add(endereco1);
		cliente.getEnderecos().add(endereco2);
		cliente.getTelefones().add(telefone);
		
		ClienteDao clienteDao = new ClienteDao();
		cliente = clienteDao.salvar(cliente);
		System.out.println("\n\n** Dados do Cliente **");
		System.out.println(cliente);

	}

	public static void main(String args[]) throws IOException {
		EntityManager manager = getEntityManager();
		populardb(manager);
	}

}
