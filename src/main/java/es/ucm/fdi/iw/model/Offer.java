package es.ucm.fdi.iw.model;


import java.io.File;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;


@NamedQueries({
	@NamedQuery(name="offerByDeviceType",
			query="select o from Offer o where o.device = :deviceParam"),

	@NamedQuery(name="offerByZipCode",
			query="select o from Offer o where o.zipCode = :zipCodeParam")
})

	@Entity
	public class Offer {
	private long id;
	private String title;
	private String description;
	private DeviceType device;
	private byte enabled;
	private String zipCode;
	private String date;

	
	private User publisher;
	

	@Id
	@GeneratedValue
	public long getId() {
	return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public DeviceType getDevice() {
		return device;
	}

	public void setDevice(DeviceType device) {
		this.device = device;
	}

	public byte getEnabled() {
		return enabled;
	}

	public void setEnabled(byte enabled) {
		this.enabled = enabled;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@ManyToOne(targetEntity = User.class)
	public User getPublisher() {
		return publisher;
	}
	public void setPublisher(User publisher) {
		this.publisher = publisher;
	}	

	
}
