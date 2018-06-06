package es.ucm.fdi.iw.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import es.ucm.fdi.iw.LocalData;
import es.ucm.fdi.iw.model.DeviceType;
import es.ucm.fdi.iw.model.Mensaje;
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
	
	@Autowired
	private LocalData localData;

	@ModelAttribute
	public void addAttributes(Model model) {
		model.addAttribute("s", "/static");
	}

	static User getUser(HttpSession session, EntityManager entityManager) {
		if ((User) session.getAttribute("user") == null)
			return null;
		return entityManager.find(User.class, ((User) session.getAttribute("user")).getId());
	}

	private void refreshUserSession(HttpSession session, Principal principal) {
		User u = (User) entityManager.createNamedQuery("userByLogin").setParameter("loginParam", principal.getName())
				.getSingleResult();
		session.setAttribute("user", u);
	}

	@GetMapping({ "/", "/index" })
	public String root(Model model, HttpSession session, Principal principal) {
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
			o.setEnabled((byte) 1);
			
			o.setTitle("hola soy angel");
			o.setZipCode("212");
			o.setPublisher(x);

			entityManager.persist(o);
			entityManager.flush();

			Repair r = new Repair();

			r.setPublisher(x);
			r.setTechnician(y);
			r.setOffer(o);
			r.setState(RepairStates.ACCEPTED);
			r.setPrice(50);
			r.setEstimatedTime("50");
			r.setInitDate(new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
			
			entityManager.persist(r);
			entityManager.flush();
		}
		return "/";
	}

	@GetMapping("/upload")
	public String upload() {
		return "upload";
	}

	@GetMapping("/profile")
	public String profile(HttpSession session, Principal principal, Model m) {
		refreshUserSession(session, principal);
		return "profile";
	}

	@GetMapping("/contact")
	public String contact() {
		return "contact";
	}

	@GetMapping("/anounce")
	public String anounce() {
		return "anounce";
	}

	@RequestMapping(value = "/addOffer", method = RequestMethod.POST)
	@Transactional
	public String addOferta(HttpServletRequest request, HttpServletResponse response,
 @RequestParam String offerTitle,
			@RequestParam int device, @RequestParam String description,
			@RequestParam MultipartFile photos, HttpSession session, Model m) {
		dumpRequest(request);
		Offer o = new Offer();

		User u = RootController.getUser(session, entityManager);

		o.setPublisher(u);
		o.setTitle(offerTitle);
		o.setDescription(description);
		o.setEnabled(1);
		o.setDevice(DeviceType.values()[device]);
		// u.setRoles("on".equals(isAdmin) ? "ADMIN,USER" : "USER");
		o.setDate(new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
		o.setZipCode(u.getZipCode());
		entityManager.persist(o);

		entityManager.flush();
		handleFileUpload(response,photos,Long.toString(o.getId()));
		log.info("*______________________________*"+Long.toString(o.getId()));
		m.addAttribute("offers", entityManager.createQuery("select o from Offer o").getResultList());

		return "home";
	}

	private void dumpRequest(HttpServletRequest request) {
		for (Map.Entry<String, String[]> e : request.getParameterMap().entrySet()) {
			log.info("\t" + e.getKey() + ": " + Arrays.toString(e.getValue()));
		}
	}

	@GetMapping("/offer")
	public String showOffer(@RequestParam long id, HttpSession session, Model m) {
		m.addAttribute("offer", entityManager.find(Offer.class, id));
		return "offer";
	}

	@GetMapping("/technician")
	public String showTech(@RequestParam long id, HttpSession session, Model m) {
		m.addAttribute("technician", entityManager.find(User.class, id));
		return "technician";
	}

	@GetMapping(value = "/searchOffers")
	public String searchOffers(HttpServletRequest request, @RequestParam String offerType,
			@RequestParam String searchParam, HttpSession session, Model m) {
		dumpRequest(request);

		if (offerType.equals("Reparar")) {

			String sP = "%" + searchParam + "%";
			javax.persistence.Query q = entityManager.createQuery(
					"SELECT o FROM Offer o WHERE o.enabled = 1 and (o.title LIKE :searchParam or o.description LIKE :searchParam)");
			q.setParameter("searchParam", sP);
			m.addAttribute("search", q.getResultList());
			return "offerList";
		} else {
			String sP = "%" + searchParam + "%";
			javax.persistence.Query q = entityManager.createQuery(
					"SELECT t FROM User t WHERE t.roles ='TECHNICIAN' and (t.skills LIKE :searchParam or t.technicalDescription LIKE :searchParam)");
			q.setParameter("searchParam", sP);
			m.addAttribute("search", q.getResultList());
			return "technicianList";
		}

	}

	@RequestMapping(value = "/addReparacion", method = RequestMethod.POST)
	@Transactional
	public String addReparacion(HttpServletRequest request, @RequestParam long idNegociacion, HttpSession session,
			Model m) {
		dumpRequest(request);

		Repair r = new Repair();
		Negociacion n = entityManager.find(Negociacion.class, idNegociacion);
		Offer o = n.getOffer();

		r.setPublisher(n.getPublisher());
		r.setTechnician(n.getTechnician());
		r.setOffer(n.getOffer());
		r.setState(RepairStates.ACCEPTED);
		r.setPrice(n.getPrice());
		r.setEstimatedTime(n.getDuration());
		r.setInitDate(new SimpleDateFormat("dd-MM-yyyy").format(new Date()));

		entityManager.persist(r);
		o.setEnabled(0);
		entityManager.remove(n);
		entityManager.flush();

		return "home";
	}

	@RequestMapping(value = "/dennyReparacion", method = RequestMethod.POST)
	@Transactional
	public String denyReparacion(HttpServletRequest request, @RequestParam long idNegociacion, 
			HttpSession session, Model m) {
		dumpRequest(request);

		Negociacion n = entityManager.find(Negociacion.class, idNegociacion);
		n.getOffer().setEnabled(1);

		entityManager.remove(n);

		return "home";
	}

	@RequestMapping(value = "/addNegociacion", method = RequestMethod.POST)
	@Transactional
	public String addNegociacion(HttpServletRequest request, @RequestParam long idOffer, @RequestParam float price,
			@RequestParam String duration, HttpSession session, Model m) {
		dumpRequest(request);

		Negociacion n = new Negociacion();
		User origen = RootController.getUser(session, entityManager);
		Offer o = entityManager.find(Offer.class, idOffer);
		o.setEnabled(0);
		n.setDuration(duration);
		n.setOffer(o);
		n.setPrice(price);
		n.setPublisher(o.getPublisher());
		n.setTechnician(origen);
		entityManager.persist(n);
		entityManager.flush();

		return "home";
	}

	@GetMapping("/repair")
	public String showRepair(@RequestParam long id, HttpSession session, Model m) {
		m.addAttribute("repair", entityManager.find(Repair.class, id));
		m.addAttribute("stringState", entityManager.find(Repair.class, id).getState().toString());
		return "repair";
	}

	@RequestMapping(value = "/changeState", method = RequestMethod.POST)
	@Transactional
	public String changeState(HttpServletRequest request, @RequestParam long idRepair, HttpSession session, Model m) {
		dumpRequest(request);

		Repair r = entityManager.find(Repair.class, idRepair);
		RepairStates currState = r.getState();
		if (currState == RepairStates.ACCEPTED) {
			r.setState(RepairStates.INPROCCESS);
		} else if (currState == RepairStates.INPROCCESS) {
			r.setState(RepairStates.FINISHED);
		} else if (currState == RepairStates.FINISHED) {
			r.setState(RepairStates.DELIVERED);
		}

		entityManager.flush();

		return "profile";
	}
	
	@RequestMapping(value="/photo/offer/{id}", 
			method = RequestMethod.GET, 
			produces = MediaType.IMAGE_JPEG_VALUE)
	public void offerPhoto(@PathVariable("id") String id, 
			HttpServletResponse response) {
	    File f = localData.getFile("user/offer", id);
	    try (InputStream in = f.exists() ? 
		    	new BufferedInputStream(new FileInputStream(f)) :
		    	new BufferedInputStream(this.getClass().getClassLoader()
		    			.getResourceAsStream("unknown-user.jpg"))) {
	    	FileCopyUtils.copy(in, response.getOutputStream());
	    } catch (IOException ioe) {
	    	response.setStatus(HttpServletResponse.SC_NOT_FOUND); // 404
	    	log.info("Error retrieving file: " + f + " -- " + ioe.getMessage());
	    }
	}

	@RequestMapping(value="/photo/user/{id}", 
			method = RequestMethod.GET, 
			produces = MediaType.IMAGE_JPEG_VALUE)
	public void userPhoto(@PathVariable("id") String id, 
			HttpServletResponse response) {
	    File f = localData.getFile("user/user", id);
	    try (InputStream in = f.exists() ? 
		    	new BufferedInputStream(new FileInputStream(f)) :
		    	new BufferedInputStream(this.getClass().getClassLoader()
		    			.getResourceAsStream("unknown-user.jpg"))) {
	    	FileCopyUtils.copy(in, response.getOutputStream());
	    } catch (IOException ioe) {
	    	response.setStatus(HttpServletResponse.SC_NOT_FOUND); // 404
	    	log.info("Error retrieving file: " + f + " -- " + ioe.getMessage());
	    }
	}
	
	@RequestMapping(value="/photo/offer/{id}", method=RequestMethod.POST)
    public @ResponseBody String handleFileUpload(
    		HttpServletResponse response,
    		@RequestParam("photo") MultipartFile photo,
    		@PathVariable("id") String id){

		String error = "";
        if (photo.isEmpty()) {
        	error = "You failed to upload a photo for " 
                + id + " because the file was empty.";        
        } else {
	        File f = localData.getFile("user/offer", id);
	        try (BufferedOutputStream stream =
	                new BufferedOutputStream(
	                    new FileOutputStream(f))) {
	            stream.write(photo.getBytes());
	            return "Uploaded " + id 
	            		+ " into " + f.getAbsolutePath() + "!";
	        } catch (Exception e) {
		    	error = "Upload failed " 
		    			+ id + " => " + e.getMessage();
	        }
        }
        // exit with error, blame user
    	response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        return error;
	}
	

	
	@RequestMapping(value = "/confirmDelivery", method = RequestMethod.POST)
	@Transactional
	public String changeState(HttpServletRequest request, @RequestParam long idRepair, @RequestParam int rate, HttpSession session, Model m) {
		dumpRequest(request);

		Repair r = entityManager.find(Repair.class, idRepair);
		r.setState(RepairStates.VALORATED);
		
		Valoracion v = new Valoracion();
		v.setFecha(new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
		v.setOrigen(r.getPublisher());
		v.setDestino(r.getTechnician());
		v.setNota((float)rate);
		
		entityManager.persist(v);
		entityManager.flush();

		return "profile";
	}
	
	
	@RequestMapping(value = "/sendMessage", method = RequestMethod.POST)
	@Transactional
	public String sendMSG(HttpServletRequest request, @RequestParam String text, 
			@RequestParam(required = false) String email, @RequestParam(required = false) String name,
			HttpSession session, Model m) {
		dumpRequest(request);
		log.info("_________________________holaaaaaa");
		User origen = RootController.getUser(session, entityManager);
		
		Mensaje msg = new Mensaje();
		msg.setDescripcion(text);
		msg.setFecha(new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
		if(origen != null) {		
			msg.setEmail(origen.getEmail());
			msg.setName(origen.getRealFirstName());
			msg.setOrigen(origen);
		}else {
			msg.setName(name);
			msg.setEmail(email);
		}
		
		entityManager.persist(msg);
		entityManager.flush();

		return "home";
	}
	
	
	
	
	
}
