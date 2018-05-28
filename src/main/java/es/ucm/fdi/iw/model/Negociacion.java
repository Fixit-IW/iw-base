package es.ucm.fdi.iw.model;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;


	@Entity
	public class Negociacion {
	private long id;
	private User publisher;
	private User technician;
	private String duration;
	private float price;
	private Offer offer;

	@Id
	@GeneratedValue
	public long getId() {
	return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}
	
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

	
	@OneToOne(targetEntity = Offer.class)
	public Offer getOffer() {
		return offer;
	}

	public void setOffer(Offer offer) {
		this.offer = offer;
	}


	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

}
