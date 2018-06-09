package es.ucm.fdi.iw.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
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
import es.ucm.fdi.iw.model.Mensaje;
import es.ucm.fdi.iw.model.Negociacion;
import es.ucm.fdi.iw.model.Offer;
import es.ucm.fdi.iw.model.Repair;
import es.ucm.fdi.iw.model.User;
import es.ucm.fdi.iw.model.Valoracion;

@Controller	
@RequestMapping("admin")
public class AdminController {
	
	private static Logger log = Logger.getLogger(AdminController.class);
	
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
		
		m.addAttribute("messages", entityManager
				.createQuery("select m from Mensaje m").getResultList());
		
		m.addAttribute("offers", entityManager
				.createQuery("select o from Offer o WHERE o.enabled = 1").getResultList());
		return "admin";	
	}
	
	
	
	@RequestMapping(value = "/deleteOffer", method = RequestMethod.POST)
	@Transactional
	public String deleteOffer(HttpServletRequest request, @RequestParam long idOffer, HttpSession session,
			Model m) {
		dumpRequest(request);

		Offer o = entityManager.find(Offer.class, idOffer);
		entityManager.remove(o);

		return "home";
	}
	
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	@Transactional
	public String deleteUser(HttpServletRequest request,
			@RequestParam long idUser, HttpSession session,
			Model m) {
		dumpRequest(request);

		User u = entityManager.find(User.class, idUser);
		for( Negociacion uN : u.getNegociaciones()) {
			entityManager.remove(uN);
		}
		for( Valoracion uV : u.getEntrantes()) {
			entityManager.remove(uV);
		}
		for( Valoracion uV : u.getSalientes()) {
			entityManager.remove(uV);
		}
		for( Offer uO : u.getOffers()) {
			entityManager.remove(uO);
		}
		for (Mensaje uM: u.getMensajes()) {
			entityManager.remove(uM);
		}
		for (Repair uRP: u.getReparacionesPublisher()) {
			entityManager.remove(uRP);
		}
		for (Repair uRT: u.getReparacionesTechnician()) {
			entityManager.remove(uRT);
		}
		entityManager.remove(u);
		
		return "home";
	}

	private void dumpRequest(HttpServletRequest request) {
		for (Map.Entry<String, String[]> e : request.getParameterMap().entrySet()) {
			log.info("\t" + e.getKey() + ": " + Arrays.toString(e.getValue()));
		}
	}
	

	
	/**
	 * Returns a users' photo
	 * @param id of user to get photo from
	 * @return the image, or error
	 */
	@RequestMapping(value="/photo/{id}", 
			method = RequestMethod.GET, 
			produces = MediaType.IMAGE_JPEG_VALUE)
	public void userPhoto(@PathVariable("id") String id, 
			HttpServletResponse response) {
	    File f = localData.getFile("user", id);
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
	
	/**
	 * Uploads a photo for a user. Intended to be used via Ajax
	 * @param id of user 
	 * @param photo to upload
	 * @return a textual response indicating success, status code
	 */
	@RequestMapping(value="/photo/{id}", method=RequestMethod.POST)
    public @ResponseBody String handleFileUpload(
    		HttpServletResponse response,
    		@RequestParam("photo") MultipartFile photo,
    		@PathVariable("id") String id){

		String error = "";
        if (photo.isEmpty()) {
        	error = "You failed to upload a photo for " 
                + id + " because the file was empty.";        
        } else {
	        File f = localData.getFile("user", id);
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
}
