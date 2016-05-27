//package at.fh.swenga.f4u.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.Pageable;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import at.fh.swenga.f4u.dao.FinanceRepository;
//import at.fh.swenga.f4u.dao.ReportRepository;
//import at.fh.swenga.f4u.dao.UserRepository;
//import at.fh.swenga.f4u.model.UserModel;
//
//@Controller
//public class UserController {
//
//	@Autowired
//	UserRepository userRepository;
//	
//	@Autowired
//	ReportRepository reportRepository;
//	
//	@Autowired
//	FinanceRepository financerepository;
//	
//	@RequestMapping(value = { "/", "list"})
//	public String index(Model model) {
//		List<UserModel> users = userRepository.findAll();
//		model.addAttribute("users", users);
//		model.addAttribute("type", "findAll");
//		return "index";
//	}
//	
//	@RequestMapping(value = { "/getPage" }) 
//	public String getPage(Pageable page,Model model) {
//		Page<UserModel> users = userRepository.findAll(page);
//		model.addAttribute("usersPage", users);
//		model.addAttribute("users", users.getContent()); 
//		model.addAttribute("type", "findAll");
//		return "index";
//	}
//	
//	@RequestMapping(value = { "/find" })
//	public String find(Model model, @RequestParam String searchString, @ModelAttribute("type")  String type) { 
//		List<UserModel> users = null;
//		
//		model.addAttribute("users", users);
//		return "index";
//	}
//	
//	public String handleAllException(Exception ex) {
//		return "showError";
//	}
//}
