package es.ucm.fdi.iw.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import javax.management.Query;
import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.tomcat.jni.Mmap;
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

import antlr.collections.List;
import es.ucm.fdi.iw.LocalData;
import es.ucm.fdi.iw.model.DeviceType;
import es.ucm.fdi.iw.model.Negociacion;
import es.ucm.fdi.iw.model.Offer;
import es.ucm.fdi.iw.model.Repair;
import es.ucm.fdi.iw.model.RepairStates;
import es.ucm.fdi.iw.model.User;
import es.ucm.fdi.iw.model.Valoracion;

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
			HttpServletResponse response,
			@RequestParam String nickName, 
			@RequestParam String password,
			@RequestParam String email,
			@RequestParam String firstName,
			@RequestParam String lastName,
			@RequestParam String DNI,
			@RequestParam String zipCode,
			@RequestParam MultipartFile photo,
			@RequestParam(value = "checkBox", required = false) String roles,
			@RequestParam String birthDate,
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
		handleFileUpload(response, photo, Long.toString(u.getId()));

		m.addAttribute("users", entityManager
				.createQuery("select u from User u").getResultList());
		
		return "login";
	}
	
	
	@RequestMapping(value="/photo/user/{id}", method=RequestMethod.POST)
    public @ResponseBody String handleFileUpload(
    		HttpServletResponse response,
    		 MultipartFile photo,
    		 String id){

		String error = "";
        if (photo.isEmpty()) {
        	error = "You failed to upload a photo for " 
                + id + " because the file was empty.";        
        } else {
	        File f = localData.getFile("user/user", id);
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
