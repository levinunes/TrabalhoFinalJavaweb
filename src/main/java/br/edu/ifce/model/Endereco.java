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
public class Endereco {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idendereco;

	@Column(length = 80)
	private String logradouro;

	@Column(length = 10)
	private String numero;

	@Column(name = "CEP", length = 8)
	private String cep;

	@Column(length = 20)
	private String cidade;

	@Column(length = 15)
	private String estado;

	@Column(length = 45)
	private String enderecocol;

	@ManyToMany(mappedBy = "enderecos")
	private List<Cliente> clientes = new ArrayList<>();

	public Integer getIdendereco() {
		return idendereco;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getEnderecocol() {
		return enderecocol;
	}

	public void setEnderecocol(String enderecocol) {
		this.enderecocol = enderecocol;
	}

	public List<Cliente> getClientes() {
		return clientes;
	}

	@Override
	public String toString() {
		return "Endereco [idendereco=" + idendereco + ", logradouro=" + logradouro + ", numero=" + numero + ", cep="
				+ cep + ", cidade=" + cidade + ", estado=" + estado + ", enderecocol=" + enderecocol + "]";
	}

}
