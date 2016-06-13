package at.fh.swenga.f4u.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import at.fh.swenga.f4u.dao.FinanceRepository;
import at.fh.swenga.f4u.dao.UserRepository;
import at.fh.swenga.f4u.model.UserModel;

@Controller
public class UserController {

	@Autowired
	UserRepository userRepository;
	
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
	public String showAddDataForm(Model model) {
		return "editUser";
	}

	@RequestMapping(value = "/addUser", method=RequestMethod.POST)
	@Transactional
	public String addData(@Valid @ModelAttribute UserModel newUserModel, BindingResult bindingResult, 
			Model model){
		
		if (bindingResult.hasErrors()) {
			String errorMessage = "";
			for (FieldError fieldError : bindingResult.getFieldErrors()) {
				errorMessage += fieldError.getField() + " is invalid<br>";
			}
			model.addAttribute("errorMessage", errorMessage);
			return "login";
		}
		
		UserModel user = userRepository.findOne(newUserModel.getId());
		
		if(user!=null){
			model.addAttribute("errorMessage", "User already exists!<br>");
		}
		else {
			UserModel um = new UserModel();
			um.setFirstName(newUserModel.getFirstName());
			um.setLastName(newUserModel.getLastName());
			um.setAddress(newUserModel.getAddress());
			um.setPostCode(newUserModel.getPostCode());
			um.setPlace(newUserModel.getPlace());
			um.setPhone(newUserModel.getPhone());
			um.setEmail(newUserModel.getEmail());
//			um.setDayOfBirth(newUserModel.getDayOfBirth());
			userRepository.save(um);
			model.addAttribute("message", "New user " + newUserModel.getId() + " added.");
		}
		
		return "login";
	}
	
	@RequestMapping(value = "/editU", method = RequestMethod.GET)
	public String showEditUserForm(Model model, @RequestParam int id) {

		UserModel user = userRepository.findOne(id);		
		if (user!=null) {
			model.addAttribute("user", user);
			return "editUser";
		} else {
			model.addAttribute("errorMessage", "Couldn't find user" + id);
			return "forward:list";
		}
	}
	
	@RequestMapping(value = "/changeUser", method = RequestMethod.POST)
	@Transactional
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
 
		UserModel user = userRepository.findOne(editUserModel.getId());

		if (user == null) {
			model.addAttribute("errorMessage", "User does not exist!<br>");
		} else {
			user.setFirstName(editUserModel.getFirstName());
			user.setLastName(editUserModel.getLastName());
			user.setAddress(editUserModel.getAddress());
			user.setPostCode(editUserModel.getPostCode());
			user.setPlace(editUserModel.getPlace());
			user.setPhone(editUserModel.getPhone());
			user.setEmail(editUserModel.getEmail());
//			user.setDayOfBirth(editUserModel.getDayOfBirth());
			userRepository.save(user);
			model.addAttribute("message", "Changed finance " + editUserModel.getId());
		}
 
		return "forward:list";
	}
	
	
	@RequestMapping("/deleteUser")
	public String deleteData(Model model, @RequestParam int id) {
		userRepository.delete(id);

		return "forward:list";
	}
	
	public String handleAllException(Exception ex) {
		return "showError";
	}
}
