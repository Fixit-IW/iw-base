package es.ucm.fdi.iw.model;


import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

@NamedQueries({
	@NamedQuery(name="userByLogin",
			query="select u from User u where u.nickName = :loginParam")
})


@Entity
public class User {
	private long id;
	private String nickName;
	private String password;
	private String roles; // split by , to separate roles
	private byte enabled;
	private String realFirstName;
	private String realLastName;
	private String dni;
	private String zipCode;
	private String birthDate;
	
	private List<Offer> offers;
	
	private List<Valoracion> salientes;
	private List<Valoracion> entrantes;
	
	@Id
	@GeneratedValue
	public long getId() {
	return id;
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
}
