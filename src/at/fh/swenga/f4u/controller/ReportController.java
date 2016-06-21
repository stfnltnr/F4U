package at.fh.swenga.f4u.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import at.fh.swenga.f4u.dao.CategorieRepository;
import at.fh.swenga.f4u.dao.FinanceRepository;
import at.fh.swenga.f4u.dao.SubCategorieRepository;
import at.fh.swenga.f4u.dao.UserRepository;
import at.fh.swenga.f4u.model.CategorieModel;
import at.fh.swenga.f4u.model.FinanceModel;
import at.fh.swenga.f4u.model.SubCategorieModel;
import at.fh.swenga.f4u.model.UserModel;


@Controller
public class ReportController {

	@Autowired
	FinanceRepository financeRepository;
	
	@Autowired
	UserRepository userRepository;

	@Autowired
	CategorieRepository categorieRepository;
	
	@Autowired
	SubCategorieRepository subCategorieRepository;
	
	//get current User
	public void currentUser(Model model) { 	
		model.addAttribute("user", getCurrrentUserModel());
	}
	
	public String getCurrentUserName(){
		Object curUser = SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
	String userName = ((UserDetails) curUser).getUsername();
	return userName;
	}
	
	public UserModel getCurrrentUserModel(){
	UserModel user = userRepository.findByUsername(getCurrentUserName());
	return user;
	}
	
	public void addCats(Model model) {
		List<CategorieModel> cats = categorieRepository.findAll();
		List<SubCategorieModel> subcats = subCategorieRepository.findByUser_username(getCurrentUserName());
		model.addAttribute("cats", cats);
		model.addAttribute("subcats", subcats);	
	}
			
		@InitBinder
		public void initBinder(WebDataBinder binder) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
			dateFormat.setLenient(false);
			binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
		}
	
	@RequestMapping(value = { "/reportAll"})
	public String report(Model model){

			List<FinanceModel> finances = financeRepository.findByUser_Username(getCurrentUserName());
			addCats(model);
			currentUser(model);
			model.addAttribute("finances",finances);
			return "excelReport";
		}
	
//	@RequestMapping(value = { "/reportDate1" })
//	public String reportDate(Model model,
//			@RequestParam Date von, @RequestParam Date bis){
//
//			List<FinanceModel> finances = financeRepository.findAll();
//			model.addAttribute("finances",finances);
//			return "excelReport";
//		}
	
	@RequestMapping(value = { "/reportDate" })
	public String findDate(Model model, @RequestParam Date searchDate1, @RequestParam Date searchDate2) {

		SimpleDateFormat formatter1 = new SimpleDateFormat("dd.MM.yyyy");
		String date1 = formatter1.format(searchDate1);
		
		SimpleDateFormat formatter2 = new SimpleDateFormat("dd.MM.yyyy");
		String date2 = formatter2.format(searchDate2);
		
		List<FinanceModel> finances = null;
		addCats(model);
		currentUser(model);
		finances = financeRepository.findByUser_UsernameAndDateBetween(getCurrrentUserModel(),searchDate1, searchDate2);
		model.addAttribute("finances", finances);
		return "excelReport";
	}

	@ExceptionHandler(Exception.class)
	public String handleAllException(Exception ex) {
		return "showError";

	}

}
