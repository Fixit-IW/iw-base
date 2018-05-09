package es.ucm.fdi.iw.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;


	@Entity
	public class Repair {
	private long id;
	private User publisher;
	private User technician;
	private Offer offer;
	private RepairStates state;
	private float price;

	
	@ManyToOne(targetEntity = User.class)
	public User getPublisher() {
		return publisher;
	}

	public void setPublisher(User publisher) {
		this.publisher = publisher;
	}
	
	
	@ManyToOne(targetEntity = User.class)
	public User getTechnician() {
		return technician;
	}

	public void setTechnician(User technician) {
		this.technician = technician;
	}

	
	@OneToOne(targetEntity = User.class)
	public Offer getOffer() {
		return offer;
	}

	public void setOffer(Offer offer) {
		this.offer = offer;
	}

	public RepairStates getState() {
		return state;
	}

	public void setState(RepairStates state) {
		this.state = state;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	@Id
	@GeneratedValue
	public long getId() {
	return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}


	

	
}
