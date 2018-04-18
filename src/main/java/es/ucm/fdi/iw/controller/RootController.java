package es.ucm.fdi.iw.controller;

import java.security.Principal;

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

import es.ucm.fdi.iw.model.User;

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

	@GetMapping({"/", "/index"})
	public String root(Model model,HttpSession session, Principal principal) {
		if (principal == null) {
			log.info("Ha entrado uno nuevo!");
			
		} else {
			log.info(principal.getName() + " de tipo " + principal.getClass());		
			if (session.getAttribute("u") == null) {
				User u = (User)entityManager.createNamedQuery("userByLogin")
					.setParameter("loginParam", principal.getName()).getSingleResult();
				session.setAttribute("u", u);
			}
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
	
	@GetMapping("/t")
	@Transactional
	public String test() {
		User u = new User();
		u.setNickName("j");
		u.setPassword(passwordEncoder.encode("jj"));
		u.setRoles("USER");
		entityManager.persist(u);
		return "/";
	}
		
	@GetMapping("/upload")
	public String upload() {
		return "upload";
	}
	
	@GetMapping("/profile")
	public String profile( HttpSession session, Principal principal) {
		if (session.getAttribute("u") == null) {
			User u = (User)entityManager.createNamedQuery("userByLogin")
				.setParameter("loginParam", principal.getName()).getSingleResult();
			session.setAttribute("u", u);
		}
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
