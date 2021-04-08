package br.edu.ifce.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Telefone {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idtelefone;

	@Column(length = 10)
	private String telefone;

	@ManyToMany(mappedBy = "telefones")
	private List<Cliente> clientes = new ArrayList<>();

	public Integer getIdtelefone() {
		return idtelefone;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public List<Cliente> getClientes() {
		return clientes;
	}

	@Override
	public String toString() {
		return "Telefone [idtelefone=" + idtelefone + ", telefone=" + telefone + "]";
	}

}
