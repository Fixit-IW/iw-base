package es.ucm.fdi.iw.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@NamedQueries({
	@NamedQuery(name="offerByDeviceType",
			query="select o from Offer o where o.device = :deviceParam"),

	@NamedQuery(name="offerByZipCode",
			query="select o from Offer o where o.zipCode = :zipCodeParam")
})





//@Entity
//@Table(name = "Offer")
public class Offer {
	private long id;
	private String title;
	private String description;
	private DeviceType device;
	private byte enabled;
	private String zipCode;
	private String date;
	private int nPhotos;
	
	public static final int MAX_PHOTOS = 4;
	@Id
	@GeneratedValue
	public long getId() {
	return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}	

	@Column(unique=true)
	public String getTitle() {
		return title;
	}

	public void setTitle(String t) {
		this.title = t;
	}

	public String getDescrition() {
		return this.description;
	}
	
	public void setDescription(String d) {
		this.description = d;
	}

	public DeviceType getDeviceType() {
		return this.device;
	}

	public void setDeviceType(DeviceType dt) {
		this.device = dt;
	}

	public byte getEnabled() {
		return enabled;
	}

	public void setEnabled(byte enabled) {
		this.enabled = enabled;
	}
	
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String d) {
		this.date = d;
	}
	
	public String getZipCode() {
		return zipCode;
	}
	
	public void setZipCode(String nzp) {
		this.zipCode = nzp;
	}
	

	public int getNPhotos() {
		return this.nPhotos;
	}
	
	public void setNPhotos() {
		this.nPhotos = 0;
	}
	
	public int addPhoto() {
		if(this.nPhotos < this.MAX_PHOTOS) {
			this.nPhotos++;
			return this.nPhotos;
		}
		else 
			return -1;	
	}
}
