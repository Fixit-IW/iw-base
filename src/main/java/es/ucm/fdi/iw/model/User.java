package es.ucm.fdi.iw.model;


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;


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
