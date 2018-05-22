package es.ucm.fdi.iw.controller;

import java.io.File;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import es.ucm.fdi.iw.model.DeviceType;
import es.ucm.fdi.iw.model.Negociacion;
import es.ucm.fdi.iw.model.Offer;
import es.ucm.fdi.iw.model.Repair;
import es.ucm.fdi.iw.model.RepairStates;
import es.ucm.fdi.iw.model.User;
import es.ucm.fdi.iw.model.Valoracion;

@Controller	
public class RootController {

	private static Logger log = Logger.getLogger(RootController.class);
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private EntityManager entityManager;
	
    @ModelAttribute
    public void addAttributes(Model model) {
        model.addAttribute("s", "/static");
    }
    
    
    static User getUser(HttpSession session, EntityManager entityManager) {
    	if((User)session.getAttribute("user") == null) return null;
    	return entityManager.find(User.class, 
    			((User)session.getAttribute("user")).getId());
    }
    
    private void refreshUserSession(HttpSession session, Principal principal) {
    	User u = (User)entityManager.createNamedQuery("userByLogin")
				.setParameter("loginParam", principal.getName()).getSingleResult();
			session.setAttribute("user", u);
    }

	@GetMapping({"/", "/index"})
	public String root(Model model,HttpSession session, Principal principal) {
		if (principal == null) {
			log.info("Ha entrado uno nuevo!");
			
		} else {
			log.info(principal.getName() + " de tipo " + principal.getClass());		
			refreshUserSession(session, principal);
		// org.springframework.security.core.userdetails.User
		}
		return "home";
	}
	
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/logout")
	public String logout() {
		return "logout";
	}
	@GetMapping("/offerList")
	public String offerList() {
		return "offerList";
	}
	@GetMapping("/technicianList")
	public String technicianList() {
		return "technicianList";
	}
	
	@GetMapping("/t")
	@Transactional
	public String test() {
		long id1, id2;
		{
			User u = new User();
			u.setNickName("b");
			u.setPassword(passwordEncoder.encode("bb"));
			u.setRoles("TECHNICIAN,USER,ADMIN");			
			entityManager.persist(u);
			entityManager.flush();
			id1 = u.getId();
		}
		{
			User u = new User();
			u.setNickName("y");
			u.setPassword(passwordEncoder.encode("y"));
			u.setRoles("TECHNICIAN");
			u.setSkills("Ipoone, mac");
			u.setTechnicalDescription("Se hacer muchas cosas");		
			entityManager.persist(u);			
			entityManager.flush();
			id2 = u.getId();
		}
		{
			User x = entityManager.find(User.class, id1);
			User y = entityManager.find(User.class, id2);
			Valoracion v = new Valoracion();
			v.setOrigen(x);
			v.setDestino(y);
			entityManager.persist(v);			
			entityManager.flush();
		
			Offer o = new Offer();
			o.setDate("asda");
			o.setDescription("hola se me ha roto la pantalla");
			o.setDevice(DeviceType.MOBILE);
			o.setEnabled((byte) 1);;
			o.setTitle("hola soy angel");
			o.setZipCode("212");
			o.setPublisher(x);
			
			entityManager.persist(o);
			entityManager.flush();
		
		}
		
		return "/";
	}
		
	@GetMapping("/upload")
	public String upload() {
		return "upload";
	}
	
	@GetMapping("/profile")
	public String profile( HttpSession session, Principal principal, Model m) {
		refreshUserSession(session, principal);
		m.addAttribute("ofertas", ((User)session.getAttribute("user")).getOffers());
		
		return "profile";

	}
	@GetMapping("/contact")
	public String contact()
	{
		return "contact";
	}
	@GetMapping("/anounce")
	public String anounce()
	{
		return "anounce";
	}
	@RequestMapping(value = "/addOffer", method = RequestMethod.POST)
	@Transactional
	public String addOferta(HttpServletRequest request,
			@RequestParam("offerTitle") String offerTitle,
			@RequestParam("device") int device,
			@RequestParam("description") String description,
			@RequestParam("photos") File photos,
			HttpSession session,
			Model m) {
		dumpRequest(request);
		Offer o = new Offer();
		
		User u = RootController.getUser(session, entityManager);
		
		o.setPublisher(u);
		o.setPhoto(photos);
		o.setTitle(offerTitle);
		o.setDescription(description);
		o.setDevice(DeviceType.values()[device]);
		//u.setRoles("on".equals(isAdmin) ? "ADMIN,USER" : "USER");
		o.setDate(new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
		o.setZipCode(u.getZipCode());
		entityManager.persist(o);
		
		entityManager.flush();
		m.addAttribute("offers", entityManager
				.createQuery("select o from Offer o").getResultList());
		
		return "home";
	}
	
	private void dumpRequest(HttpServletRequest request) {
		for (Map.Entry<String, String[]> e : request.getParameterMap().entrySet()) {
			log.info("\t" + e.getKey() + ": " + Arrays.toString(e.getValue()));
		}
	}
	
	@GetMapping("/offer")
	public String showOffer(
			@RequestParam long id,
			HttpSession session,
			Model m) {
		m.addAttribute("offer", entityManager.find(Offer.class, id));
		return "offer";
	}
	
	@GetMapping("/technician")
	public String showTech(
			@RequestParam long id,
			HttpSession session,
			Model m) {
		m.addAttribute("technician", entityManager.find(User.class, id));
		return "technician";
	}
	
	@GetMapping(value = "/searchOffers")
	public String searchOffers(HttpServletRequest request,
			@RequestParam("offerType") String offerType,
			@RequestParam("searchParam") String searchParam,
			HttpSession session,
			Model m) {
		dumpRequest(request);
		
		User u = RootController.getUser(session, entityManager);		
		
		if(offerType.equals("Reparar")) {
			
		    String sP = "%" + searchParam + "%";			
			javax.persistence.Query q = entityManager.createQuery("SELECT o FROM Offer o WHERE o.title LIKE :searchParam or o.description LIKE :searchParam ");
			q.setParameter("searchParam", sP);
			m.addAttribute("search", q.getResultList());
			return "offerList";
		}
		else  {
			String sP = "%" + searchParam + "%";			
			javax.persistence.Query q = entityManager.createQuery("SELECT t FROM User t WHERE t.roles ='TECHNICIAN' and (t.skills LIKE :searchParam or t.technicalDescription LIKE :searchParam)");
			q.setParameter("searchParam", sP);
			m.addAttribute("search", q.getResultList());
			return "technicianList";
		}		
		
	}



	@RequestMapping(value = "/addValoracion", method = RequestMethod.POST)
	@Transactional
	public String addValoracion(HttpServletRequest request,
			@RequestParam long idReparacion,	
			@RequestParam float nota, 
			HttpSession session,
			Model m) {
		dumpRequest(request);
		
		Valoracion v = new Valoracion();
		
		User origen = RootController.getUser(session, entityManager);	
		User destino = entityManager.find(User.class, idReparacion);
		v.setFecha(new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
		v.setOrigen(origen);
		v.setNota(nota);
		v.setDestino(destino);
		entityManager.persist(v);
		
		return "home";
	}
	
	
	@RequestMapping(value = "/addReparacion", method = RequestMethod.POST)
	@Transactional
	public String addReparacion(HttpServletRequest request,
			@RequestParam long idNegociacion,
			HttpSession session,
			Model m) {
		dumpRequest(request);
		
		Repair r = new Repair();
		Negociacion n = entityManager.find(Negociacion.class, idNegociacion);
		
		r.setPublisher(n.getPublisher());
		r.setTechnician(n.getTechnician());
		r.setOffer(n.getOffer());
		r.setState(RepairStates.ACCEPTED);
		r.setPrice(n.getPrice());
		r.setEstimatedTime(n.getDuration());
		r.setInitDate(new SimpleDateFormat("dd-MM-yyyy").format(new Date()));	
		
		entityManager.persist(r);
		
		return "home";
	}
	
	@RequestMapping(value = "/addNegociacion", method = RequestMethod.POST)
	@Transactional
	public String addNegociacion(HttpServletRequest request,
			@RequestParam long idOffer,
			@RequestParam float price,
			@RequestParam String duration,
			HttpSession session,
			Model m) {
		dumpRequest(request);
		
		Negociacion n = new Negociacion();
		User origen = RootController.getUser(session, entityManager);
		Offer o = entityManager.find(Offer.class, idOffer);
		n.setDuration(duration);
		n.setOffer(o);
		n.setPrice(price);
		n.setPublisher(o.getPublisher());
		n.setTechnician(origen);
		entityManager.persist(n);
		
		return "home";
	}
}
