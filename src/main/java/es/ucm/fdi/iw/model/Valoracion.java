package es.ucm.fdi.iw.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Valoracion {
	
	private long id;
	private float nota;
	private String fecha;
	private User origen;
	private User destino;
	
	@Id
	@GeneratedValue
	public long getId() {
	return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}

	@ManyToOne(targetEntity = User.class)
	public User getOrigen() {
		return origen;
	}

	public void setOrigen(User origen) {
		this.origen = origen;
	}

	@ManyToOne(targetEntity = User.class)
	public User getDestino() {
		return destino;
	}

	public void setDestino(User destino) {
		this.destino = destino;
	}	
	
	public float getNota() {
		return nota;
	}

	public void setNota(float nota) {
		this.nota = nota;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	
}
