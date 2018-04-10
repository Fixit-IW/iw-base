package es.ucm.fdi.iw.controller;

import java.security.Principal;

import javax.persistence.EntityManager;

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
	public String root(Model model, Principal principal) {
		if (principal == null) {
			log.info("Ha entrado uno nuevo!");
		} else {
			log.info(principal.getName() + " de tipo " + principal.getClass());		
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
	public String profile() {
		return "profile";
	}
	
}
