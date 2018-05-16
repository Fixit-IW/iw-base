package es.ucm.fdi.iw.controller;

import java.security.Principal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import es.ucm.fdi.iw.model.DeviceType;
import es.ucm.fdi.iw.model.Offer;
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
	
	@GetMapping("/t")
	@Transactional
	public String test() {
		long id1, id2;
		{
			User u = new User();
			u.setNickName("x");
			u.setPassword(passwordEncoder.encode("x"));
			u.setRoles("USER");
			entityManager.persist(u);
			entityManager.flush();
			id1 = u.getId();
		}
		{
			User u = new User();
			u.setNickName("y");
			u.setPassword(passwordEncoder.encode("y"));
			u.setRoles("USER");
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
}
