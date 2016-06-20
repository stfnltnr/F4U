package at.fh.swenga.f4u.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
public class FinanceController {

	@Autowired
	FinanceRepository financeRepository;

	@Autowired
	UserRepository userRepository;

//	@Autowired
//	PermanentRepository permanentRepository;

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
	
	// LOGIN
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public String handleLogin() {
			return "login";
		}

	@RequestMapping(value = { "/", "list" })
	public String index(Model model) {
		List<FinanceModel> finances = financeRepository.findByUser_UsernameOrderByBookDate(getCurrentUserName());
		model.addAttribute("finances", finances);
		addCats(model);
		currentUser(model);
		return "index";
	}

	@RequestMapping(value = { "/getPage" })
	public String getPage(Pageable page, Model model) {
		Page<FinanceModel> finances = financeRepository.findAll(page);
		model.addAttribute("financePage", finances);
		model.addAttribute("finances", finances.getContent());
		currentUser(model);
		model.addAttribute("type", "findAll");
		return "index";
	}
		
	@RequestMapping(value = { "/searchNotes" })
	public String findById(Model model, @RequestParam String searchString ) {
		List<FinanceModel> finances = null;
		addCats(model);
		currentUser(model);
		finances = financeRepository.findByUser_UsernameAndNotesIgnoreCaseContaining(getCurrentUserName(),searchString);
		model.addAttribute("finances", finances);
		return "index";
	}
	
	@RequestMapping(value ="/filterByCat")
	public String filterCat(Model model, @RequestParam int id) {
		List<FinanceModel> finances = null;
		addCats(model);
		currentUser(model);
		if(id==0) {finances = financeRepository.findByUser_UsernameOrderByBookDate(getCurrentUserName());} else finances=financeRepository.findByUser_UsernameAndCategorieId(getCurrentUserName(),id);
		model.addAttribute("finances", finances);
		return "index";
	}
	
	@RequestMapping(value ="/filterBySubCat")
	public String filterSubCat(Model model, @RequestParam int id) {
		List<FinanceModel> finances = null;
		addCats(model);
		currentUser(model);
		if(id==0) {finances = financeRepository.findByUser_UsernameOrderByBookDate(getCurrentUserName());} 
		else finances = financeRepository.findByUser_UsernameAndSubcategorieId(getCurrentUserName(),id);
		model.addAttribute("finances", finances);
		return "index";
	}

	@RequestMapping(value = { "/findValue" })
	public String findValue(Model model, @RequestParam double searchValue, @ModelAttribute("type") String type) {
		List<FinanceModel> finances = null;
		addCats(model);
		currentUser(model);

		switch (type) {
		case "findAll":
			finances = financeRepository.findByUser_Username(getCurrentUserName());
			break;
			
		case "findByValue":
			finances = financeRepository.findByUser_UsernameAndValue(getCurrentUserName(),searchValue);
			break;
			
//		case "findByValueBetween":
//			finances = financeRepository.findByValueBetween(searchValue);
//			break;
			
		case "findByValueGreaterThanEqual":
			finances = financeRepository.findByUser_UsernameAndValueGreaterThanEqual(getCurrentUserName(),searchValue);
			break;
			
		case "findByValueLessThanEqual":
			finances = financeRepository.findByUser_UsernameAndValueLessThanEqual(getCurrentUserName(),searchValue);
			break;
		}
		model.addAttribute("finances", finances);
		return "index";
	}
	
	@RequestMapping(value = { "/findBool" })
	public String findBool(Model model, @ModelAttribute("type") String type) {
		List<FinanceModel> finances = null;
		addCats(model);
		currentUser(model);
		boolean income = true;
		boolean outcome = false;

		switch (type) {
		case "findAll":
			finances = financeRepository.findByUser_Username(getCurrentUserName());
			break;
			
		case "findIncome":
			finances = financeRepository.findByUser_UsernameAndIncome(getCurrrentUserModel(),income);
			break;
		
		case "findOutcome":
			finances = financeRepository.findByUser_UsernameAndOutcome(getCurrrentUserModel(),outcome);
			break;
		}
		model.addAttribute("finances", finances);
		return "index";
	}
	
	@RequestMapping(value = { "/findDate" })
	public String findDate(Model model, @RequestParam Date searchDate, @ModelAttribute("type") String type) {
		
		List<FinanceModel> finances = null;
		addCats(model);
		currentUser(model);
		finances = financeRepository.findByUser_UsernameAndBookDate(getCurrentUserName(),searchDate);
		model.addAttribute("finances", finances);
		return "index";
	}

	@RequestMapping(value = { "/findById" })
	public String findById(@RequestParam("id") FinanceModel e, Model model) {

		List<FinanceModel> finances = new ArrayList<>();
		finances.add(e);
		currentUser(model);
		model.addAttribute("finances", finances);

		return "index";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String showAddDataForm(Model model) {
		List<CategorieModel> cats = categorieRepository.findAll();
		List<SubCategorieModel> subcats = subCategorieRepository.findByUser_username(getCurrentUserName());
		model.addAttribute("cats", cats);
		model.addAttribute("subcats", subcats);
		currentUser(model);
		return "editFinance";
	}

	@RequestMapping(value = "/addFinance", method=RequestMethod.POST)
	@Transactional
	public String addData(@Valid @ModelAttribute FinanceModel newFinanceModel, BindingResult bindingResult, 
			Model model){
		
		if (bindingResult.hasErrors()) {
			String errorMessage = "";
			for (FieldError fieldError : bindingResult.getFieldErrors()) {
				errorMessage += fieldError.getField() + " is invalid<br>";
			}
			model.addAttribute("errorMessage", errorMessage);
			return "forward:list";
		}
		
		FinanceModel finance = financeRepository.findOne(newFinanceModel.getId());
		
		if(finance!=null){
			model.addAttribute("errorMessage", "Finance already exists!<br>");
		}
		else {
			FinanceModel fm = new FinanceModel();
//			fm.setId(newFinanceModel.getId());
			fm.setPayment(newFinanceModel.isPayment());
			fm.setBookDate(newFinanceModel.getBookDate());
			fm.setValue(newFinanceModel.getValue());
			fm.setNotes(newFinanceModel.getNotes());
			fm.setCategorie(newFinanceModel.getCategorie());
			fm.setSubcategorie(newFinanceModel.getSubcategorie());
			fm.setUser(getCurrrentUserModel());
			financeRepository.save(fm);
			model.addAttribute("message", "New finance " + newFinanceModel.getNotes() + " added.");
		}
		
		return "forward:list";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String showEditFinanceForm(Model model, @RequestParam int id) {

		FinanceModel finance = financeRepository.findOne(id);		
		if (finance!=null) {
			addCats(model);
			model.addAttribute("finance", finance);
			currentUser(model);
			return "editFinance";
		} else {
			model.addAttribute("errorMessage", "Couldn't find finance" + id);
			return "forward:list";
		}
	}
	
	@RequestMapping(value = "/changeFinance", method = RequestMethod.POST)
	@Transactional
	public String editFinance(@Valid @ModelAttribute FinanceModel editFinanceModel, BindingResult bindingResult,
			Model model) {
 
		if (bindingResult.hasErrors()) {
			String errorMessage = "";
			for (FieldError fieldError : bindingResult.getFieldErrors()) {
				errorMessage += fieldError.getField() + " is invalid<br>";
			}
			model.addAttribute("errorMessage", errorMessage);
			return "forward:list";
		}
 
		FinanceModel finance = financeRepository.findOne(editFinanceModel.getId());
		if (finance == null) {
			model.addAttribute("errorMessage", "Finance does not exist!<br>");
		} else {
			
			finance.setId(editFinanceModel.getId());
			finance.setPayment(editFinanceModel.isPayment());
			finance.setBookDate(editFinanceModel.getBookDate());
			finance.setValue(editFinanceModel.getValue());
			finance.setNotes(editFinanceModel.getNotes());
			finance.setCategorie(editFinanceModel.getCategorie());
			finance.setSubcategorie(editFinanceModel.getSubcategorie());
			finance.setUser(getCurrrentUserModel());
			financeRepository.save(finance);
			model.addAttribute("message", "Changed finance " + editFinanceModel.getNotes());
		}
 
		return "forward:list";
	}
			
	@RequestMapping("/delete")
	public String deleteData(Model model, @RequestParam int id) {
		financeRepository.delete(id);
		addCats(model);
		currentUser(model);

		return "forward:list";
	}

	public String handleAllException(Exception ex) {
		return "showError";
	}
}