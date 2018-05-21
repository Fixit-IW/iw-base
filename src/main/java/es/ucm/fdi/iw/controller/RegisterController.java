package es.ucm.fdi.iw.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import javax.management.Query;
import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.tomcat.jni.Mmap;
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

import antlr.collections.List;
import es.ucm.fdi.iw.LocalData;
import es.ucm.fdi.iw.model.DeviceType;
import es.ucm.fdi.iw.model.Offer;
import es.ucm.fdi.iw.model.User;

@Controller	
@RequestMapping("register")
public class RegisterController {
	
	private static Logger log = Logger.getLogger(RegisterController.class);
	
	@Autowired
	private LocalData localData;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private EntityManager entityManager;

    @ModelAttribute
    public void addAttributes(Model model) {
        model.addAttribute("s", "../static");
    }

	@GetMapping({"", "/"})
	public String root(Model m) {
		m.addAttribute("users", entityManager
				.createQuery("select u from User u").getResultList());
		
		return "register";	
	}

	private void dumpRequest(HttpServletRequest request) {
		for (Map.Entry<String, String[]> e : request.getParameterMap().entrySet()) {
			log.info("\t" + e.getKey() + ": " + Arrays.toString(e.getValue()));
		}
	}
	
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	@Transactional
	public String addUser(HttpServletRequest request,
			@RequestParam String nickName, 
			@RequestParam String password,
			@RequestParam ("email")String email,
			@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName,
			@RequestParam("DNI") String DNI,
			@RequestParam("zipCode") String zipCode,
			@RequestParam(value = "checkBox", required = false) String roles,
			@RequestParam ("birthDate")String birthDate,
			@RequestParam(value = "technicalDescription",  required = false) String description,
			@RequestParam(value = "skills",  required = false) String skills,
			Model m) {
		dumpRequest(request);
		User u = new User();
		u.setEmail(email);
		u.setNickName(nickName);
		u.setPassword(passwordEncoder.encode(password));
		u.setRealFirstName(firstName);
		u.setRealLastName(lastName);
		u.setDni(DNI);
		u.setBirthDate(birthDate);
		u.setZipCode(zipCode);
		if(roles == null || roles.equals("false")) {
			u.setRoles("USER");			
		}else {
			u.setRoles("TECHNICIAN");
			u.setSkills(skills);
			u.setTechnicalDescription(description);			
		}
		
		//u.setRoles("on".equals(isAdmin) ? "ADMIN,USER" : "USER");
		entityManager.persist(u);
		
		entityManager.flush();
		m.addAttribute("users", entityManager
				.createQuery("select u from User u").getResultList());
		
		return "login";
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
	
	
	@RequestMapping(value = "/searchOffers", method = RequestMethod.POST)
	@Transactional
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
	
}
