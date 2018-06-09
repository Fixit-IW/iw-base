package es.ucm.fdi.iw.model;


import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

import org.hibernate.validator.constraints.Email;

@NamedQueries({
	@NamedQuery(name="userByLogin",
			query="select u from User u where u.nickName = :loginParam")
})

@Entity
public class User {
	private long id;
	private String nickName;
	private String email;

	private String password;
	private String roles; // split by , to separate roles
	private byte enabled;
	private String realFirstName;
	private String realLastName;
	private String dni;
	private String zipCode;
	private String birthDate;
	private float nota;

	private String technicalDescription;
	private String skills;
	
	private List<Offer> offers;
	
	private List<Valoracion> salientes;
	private List<Valoracion> entrantes;
	
	private List<Repair> reparacionesPublisher;
	private List<Repair> reparacionesTechnician;
	
	private List<Mensaje> mensajes;
	
	
	private List<Negociacion> negociaciones;
	
	
	
	public void calculaNota(float nota) {
		
		List<Valoracion> v = this.getEntrantes();
		int n = v.size();
		
		
		float sum = nota;
		
		for(int i = 0; i < n; i++) {
			
			sum += v.get(i).getNota();
			
		}
		
		float notaFinal = sum / (n + 1);		
		this.setNota(notaFinal);
		
	}
	
	public float getNota() {
		return nota;
	}	

	public void setNota(float nota) {
		this.nota = nota;
	}
	
	
	public String getTechnicalDescription() {
		return technicalDescription;
	}


	public void setTechnicalDescription(String technicalDescription) {
		this.technicalDescription = technicalDescription;
	}


	public String getSkills() {
		return skills;
	}


	public void setSkills(String skills) {
		this.skills = skills;
	}


	
	@Id
	@GeneratedValue
	public long getId() {
	return id;
	}
	
	
	@OneToMany(targetEntity = Repair.class)
	@JoinColumn(name = "publisher_id")
	public List<Repair> getReparacionesPublisher() {
		return reparacionesPublisher;
	}


	public void setReparacionesPublisher(List<Repair> reparacionesPublisher) {
		this.reparacionesPublisher = reparacionesPublisher;
	}

	@OneToMany(targetEntity = Repair.class)
	@JoinColumn(name = "technician_id")
	public List<Repair> getReparacionesTechnician() {
		return reparacionesTechnician;
	}


	public void setReparacionesTechnician(List<Repair> reparacionesTecnico) {
		this.reparacionesTechnician = reparacionesTecnico;
	}


	public String getEmail() {
		return email;
	}
	
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setId(long id) {
		this.id = id;
	}	

	@Column(unique=true)
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String login) {
		this.nickName = login;
	}

	@OneToMany(targetEntity = Valoracion.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "origen_id")	
	public List<Valoracion> getSalientes() {
		return salientes;
	}

	public void setSalientes(List<Valoracion> salientes) {
		this.salientes = salientes;
	}

	@OneToMany(targetEntity = Valoracion.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "destino_id")
	public List<Valoracion> getEntrantes() {
		return entrantes;
	}

	
	@OneToMany(targetEntity = Offer.class)
	@JoinColumn(name = "publisher_id")
	public List<Offer> getOffers() {
		return offers;
	}
	
	public void setOffers(List<Offer> offers) {
		this.offers = offers;
	}

	public void setEntrantes(List<Valoracion> entrantes) {
		this.entrantes = entrantes;
	}

	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}

	public byte getEnabled() {
		return enabled;
	}

	public void setEnabled(byte enabled) {
		this.enabled = enabled;
	}
	
	public String getRealFirstName() {
		return realFirstName;
	}
	
	public void setRealFirstName(String rfn) {
		this.realFirstName = rfn;
	}
	
	public String getRealLastName() {
		return realLastName;
	}
	
	public void setRealLastName(String rln) {
		this.realLastName = rln;
	}
	public String getDni() {
		return dni;
	}
	@Column(unique=true)
	public void setDni(String nDni) {
		this.dni = nDni;
	}
	
	public String getBirthDate() {
		return birthDate;
	}
	
	public void setBirthDate(String nBirthDate) {
		this.birthDate = nBirthDate;
	}
	
	public String getZipCode() {
		return zipCode;
	}
	
	public void setZipCode(String nzp) {
		this.zipCode = nzp;
	}

	@OneToMany(targetEntity = Negociacion.class)
	@JoinColumn(name = "publisher_id")
	public List<Negociacion> getNegociaciones() {
		return negociaciones;
	}

	
	public void setNegociaciones(List<Negociacion> negociaciones) {
		this.negociaciones = negociaciones;
	}

	@OneToMany(targetEntity = Mensaje.class)
	@JoinColumn(name = "origen_id")
	public List<Mensaje> getMensajes() {
		return mensajes;
	}

	public void setMensajes(List<Mensaje> mensajes) {
		this.mensajes = mensajes;
	}
	
	
	
}
