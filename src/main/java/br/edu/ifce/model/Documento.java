package br.edu.ifce.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "documentos")
public class Documento {

	@Id
	private Integer id;

	@Column(length = 45)
	private String rg;

	@Column(length = 45)
	private String cpf;
	
	@OneToOne
    @MapsId
    @JoinColumn(name = "cliente_idcliente")
    private Cliente cliente;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	@Override
	public String toString() {
		return "Documento [id=" + id + ", rg=" + rg + ", cpf=" + cpf + ", cliente=" + cliente + "]";
	}

	
}
