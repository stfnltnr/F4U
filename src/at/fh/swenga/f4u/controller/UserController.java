package at.fh.swenga.f4u.controller;

import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import at.fh.swenga.f4u.dao.FinanceRepository;
import at.fh.swenga.f4u.dao.PictureRepository;
import at.fh.swenga.f4u.dao.UserRepository;
import at.fh.swenga.f4u.dao.UserRoleRepository;
import at.fh.swenga.f4u.model.PictureModel;
import at.fh.swenga.f4u.model.UserModel;
import at.fh.swenga.f4u.model.UserRole;

@Controller
public class UserController {

	@Autowired
	UserRepository userRepository;
	
	@Autowired
	UserRoleRepository userRoleRepository;
	
//	@Autowired
//	ReportRepository reportRepository;
//	
	@Autowired
	FinanceRepository financeRepository;
	
	@Autowired
	PictureRepository pictureRepository;
	
//	@RequestMapping(value = { "/", "listUser"})
//	public String listUser(Model model) {
//		List<UserModel> users = userRepository.findAll();
//		model.addAttribute("users", users);
//		model.addAttribute("type", "findAll");
//		return "listUser";
//	}
			
	@RequestMapping(value = "/addU", method = RequestMethod.GET)
	public String showAddDataForm() {
		return "editPassword";
	}
	
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addData(@RequestParam String pwd2, @Valid @ModelAttribute UserModel newUserModel, BindingResult bindingResult,Model model) {
		
		if (bindingResult.hasErrors()) {
			String errorMessage = "";
			for (FieldError fieldError : bindingResult.getFieldErrors()) {
				errorMessage += fieldError.getField() + " is invalid<br>";
			}
			model.addAttribute("errorMessage", errorMessage);
			return "login";
		}
		
		UserModel user = userRepository.findByUsername(newUserModel.getUsername());
		
		if(user!=null){
			model.addAttribute("errorMessage", "User already exists!<br>");
		}
		else {
			UserRole userRole = new UserRole(newUserModel, "ROLE_USER");
			UserModel um = new UserModel();
			um.setUsername(newUserModel.getUsername());
			um.seteMail(newUserModel.geteMail());
			um.setPassword(pwd2);
			um.setEnabled(true);
			userRepository.save(um);
			userRoleRepository.save(userRole);
						
			model.addAttribute("message", "New user " + newUserModel.getUsername() + " added.");
		}
		
		return "login";
	}
	
	@RequestMapping(value = "/editUser", method = RequestMethod.GET)
	public String showEditUserForm(Model model) {
		
		//get current User
		Object curUser = SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		if (curUser instanceof UserDetails) {
			String userName = ((UserDetails) curUser).getUsername();
			UserModel user = userRepository.findByUsername(userName);
		
		if (user!=null) {
			model.addAttribute("user", user);
			return "editUser";
		} else {
			model.addAttribute("errorMessage", "Couldn't find user " + userName);
			return "forward:list";
		}
		}
		else {return "forward:list";}
	}
	
	@RequestMapping(value = "/changeUser", method = RequestMethod.POST)
	public String editUser(@Valid @ModelAttribute UserModel editUserModel, BindingResult bindingResult,
			Model model) {
		 
		if (bindingResult.hasErrors()) {
			String errorMessage = "";
			for (FieldError fieldError : bindingResult.getFieldErrors()) {
				errorMessage += fieldError.getField() + " is invalid<br>";
			}
			model.addAttribute("errorMessage", errorMessage);
			return "forward:list";
		}
 
			UserModel user = userRepository.findByUsername(editUserModel.getUsername());
			
			if (user == null) {
				model.addAttribute("errorMessage", "User does not exist!<br>");
			} else {
			user.seteMail(editUserModel.geteMail());
			userRepository.save(user);
			model.addAttribute("message", "Changed " + editUserModel.getUsername());
			}
		return "forward:list";
	}
	
	@RequestMapping(value = "/editPassword", method = RequestMethod.GET)
	public String showEditPassword(Model model) {
		
		//get current User
		Object curUser = SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		if (curUser instanceof UserDetails) {
			String userName = ((UserDetails) curUser).getUsername();
			UserModel user = userRepository.findByUsername(userName);
		
		if (user!=null) {
			model.addAttribute("user", user);
			return "editPassword";
		} else {
			model.addAttribute("errorMessage", "Couldn't find user " + userName);
			return "forward:list";
		}
		}
		else {return "forward:list";}
	}
	
	@RequestMapping(value = "/changePWD", method = RequestMethod.POST)
	public String editPWD(@RequestParam String pwd2, @Valid @ModelAttribute UserModel editUserModel, BindingResult bindingResult,
			Model model) {
 
		if (bindingResult.hasErrors()) {
			String errorMessage = "";
			for (FieldError fieldError : bindingResult.getFieldErrors()) {
				errorMessage += fieldError.getField() + " is invalid<br>";
			}
			model.addAttribute("errorMessage", errorMessage);
			return "forward:list";
		}
 
		UserModel user = userRepository.findByUsername(editUserModel.getUsername());

		if (user == null) {
			model.addAttribute("errorMessage", "User does not exist!<br>");
		} else {
//			user.setUsername(editUserModel.getUsername());
			user.setPassword(pwd2);
			userRepository.save(user);
			model.addAttribute("message", "Password of " + editUserModel.getUsername() + " changed!");
		}
 
		return "forward:list";
	}
	
	/**
	 * Display the upload form
	 * @param model
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String showUploadForm(Model model) {
			
			//get current User
			Object curUser = SecurityContextHolder.getContext()
					.getAuthentication().getPrincipal();
			if (curUser instanceof UserDetails) {
				String userName = ((UserDetails) curUser).getUsername();
				UserModel user = userRepository.findByUsername(userName);
			
			if (user!=null) {
				model.addAttribute("user", user);
				return "uploadFile";
			} else {
				model.addAttribute("errorMessage", "Couldn't find user " + userName);
				return "forward:list";
			}
			}
			else {return "forward:list";}
	}
	
	/**
	 * Save uploaded file to the database (as 1:1 relationship to user)
	 * @param model
	 * @param username
	 * @param file
	 * @return
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadPicture(Model model, @RequestParam("myFile") MultipartFile file) {
		//get current User
		Object curUser = SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		if (curUser instanceof UserDetails) {
			String userName = ((UserDetails) curUser).getUsername();
			
		try {
 
			UserModel user = userRepository.findByUsername(userName);
 
			// Already a picture available -> delete it
			if (user.getPicture()!=null) {
				pictureRepository.delete(user.getPicture());
				user.setPicture(null);
			}
 
			//Create a new picture and set all available infos 
			PictureModel pic = new PictureModel();
			pic.setContent(file.getBytes());
			pic.setContentType(file.getContentType());
			pic.setCreated(new Date());
			pic.setFilename(file.getOriginalFilename());
			pic.setName(file.getName());
			user.setPicture(pic);
			userRepository.save(user);
		} catch (Exception e) {
			model.addAttribute("errorMessage", "Error:" + e.getMessage());
		}}
 
		return "forward:list";
	}
		
	public String handleAllException(Exception ex) {
		return "showError";
	}
}
