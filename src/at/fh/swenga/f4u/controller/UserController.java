package at.fh.swenga.f4u.controller;

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

import at.fh.swenga.f4u.dao.FinanceRepository;
import at.fh.swenga.f4u.dao.UserRepository;
import at.fh.swenga.f4u.dao.UserRoleRepository;
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
	FinanceRepository financerepository;
	
//	@RequestMapping(value = { "/", "listUser"})
//	public String listUser(Model model) {
//		List<UserModel> users = userRepository.findAll();
//		model.addAttribute("users", users);
//		model.addAttribute("type", "findAll");
//		return "listUser";
//	}
			
	@RequestMapping(value = "/addU", method = RequestMethod.GET)
	public String showAddDataForm() {
		return "editUser";
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
	public String editUser(@RequestParam String pwd2, @Valid @ModelAttribute UserModel editUserModel, BindingResult bindingResult,
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
			user.setUsername(editUserModel.getUsername());
			user.setPassword(pwd2);
			userRepository.save(user);
			model.addAttribute("message", "Changed finance " + editUserModel.getUsername());
		}
 
		return "forward:list";
	}
		
	public String handleAllException(Exception ex) {
		return "showError";
	}
}
