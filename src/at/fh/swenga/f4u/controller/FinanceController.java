package at.fh.swenga.f4u.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
	
	// LOGIN
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String handleLogin() {
		return "login";
	}
	
	public void addCats(Model model) {
		List<CategorieModel> cats = categorieRepository.findAll();
		List<SubCategorieModel> subcats = subCategorieRepository.findAll();
		model.addAttribute("cats", cats);
		model.addAttribute("subcats", subcats);	
	}

	@RequestMapping(value = { "/", "list" })
	public String index(Model model) {
		List<FinanceModel> finances = financeRepository.findAllByOrderByBookDate();
		model.addAttribute("finances", finances);
		addCats(model);
		return "index";
	}

	@RequestMapping(value = { "/getPage" })
	public String getPage(Pageable page, Model model) {
		Page<FinanceModel> finances = financeRepository.findAll(page);
		model.addAttribute("financePage", finances);
		model.addAttribute("finances", finances.getContent());
		model.addAttribute("type", "findAll");
		return "index";
	}
	

	@RequestMapping(value = { "/find" })
	public String find(Model model, @RequestParam String searchString, @ModelAttribute("type") String type) {
		List<FinanceModel> finances = null;

		switch (type) {
		case "findAll":
			finances = financeRepository.findAll();
			break;

		case "findByNotesIgnoreCaseContaining":
			finances = financeRepository.findByNotesIgnoreCaseContaining(searchString);
			break;

		case "findByCategorieName":
			finances = financeRepository.findByCategorieName(searchString);
			break;
			
		case "findByUsername":
			finances = financeRepository.findByUser_Username(searchString);
			break;
		}
		model.addAttribute("finances", finances);
		return "index";
	}
	
	@RequestMapping(value = { "/searchNotes" })
	public String findById(Model model, @RequestParam String searchString ) {
		List<FinanceModel> finances = null;
		addCats(model);
		finances = financeRepository.findByNotesIgnoreCaseContaining(searchString);
		model.addAttribute("finances", finances);
		return "index";
	}
	
	@RequestMapping(value ="/filterByCat")
	public String filterCat(Model model, @RequestParam int id) {
		List<FinanceModel> finances = null;
		addCats(model);
		if(id==0) {finances = financeRepository.findAllByOrderByBookDate();} else finances=financeRepository.findByCategorieId(id);
		model.addAttribute("finances", finances);
		return "index";
	}
	
	@RequestMapping(value ="/filterBySubCat")
	public String filterSubCat(Model model, @RequestParam int id) {
		List<FinanceModel> finances = null;
		addCats(model);
		if(id==0) {finances = financeRepository.findAllByOrderByBookDate();} else finances = financeRepository.findBySubcategorieId(id);
		model.addAttribute("finances", finances);
		return "index";
	}

	@RequestMapping(value = { "/findValue" })
	public String findValue(Model model, @RequestParam double searchValue, @ModelAttribute("type") String type) {
		List<FinanceModel> finances = null;
		addCats(model);

		switch (type) {
		case "findAll":
			finances = financeRepository.findAll();
			break;
			
		case "findByValue":
			finances = financeRepository.findByValue(searchValue);
			break;
			
//		case "findByValueBetween":
//			finances = financeRepository.findByValueBetween(searchValue);
//			break;
			
		case "findByValueGreaterThanEqual":
			finances = financeRepository.findByValueGreaterThanEqual(searchValue);
			break;
			
		case "findByValueLessThanEqual":
			finances = financeRepository.findByValueLessThanEqual(searchValue);
			break;
		}
		model.addAttribute("finances", finances);
		return "index";
	}
	
	@RequestMapping(value = { "/findBool" })
	public String findBool(Model model, @ModelAttribute("type") String type) {
		List<FinanceModel> finances = null;
		addCats(model);
		boolean income = true;
		boolean outcome = false;

		switch (type) {
		case "findAll":
			finances = financeRepository.findAll();
			break;
			
		case "findIncome":
			finances = financeRepository.findIncome(income);
			break;
		
		case "findOutcome":
			finances = financeRepository.findOutcome(outcome);
			break;
		}
		model.addAttribute("finances", finances);
		return "index";
	}
	
	@RequestMapping(value = { "/findDate" })
	public String findDate(Model model, @RequestParam Date searchDate) {
		System.out.println(searchDate);

		SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy");
		String date = formatter.format(searchDate);
		System.out.println(date);
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
		model.addAttribute("finances", finances);

		return "index";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String showAddDataForm(Model model) {
		List<CategorieModel> cats = categorieRepository.findAll();
		List<SubCategorieModel> subcats = subCategorieRepository.findAll();
		model.addAttribute("cats", cats);
		model.addAttribute("subcats", subcats);
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
//			finance.setUser(editFinanceModel.getUser());
			financeRepository.save(finance);
			model.addAttribute("message", "Changed finance " + editFinanceModel.getNotes());
		}
 
		return "forward:list";
	}
			
	@RequestMapping("/delete")
	public String deleteData(Model model, @RequestParam int id) {
		financeRepository.delete(id);

		return "forward:list";
	}

	public String handleAllException(Exception ex) {
		return "showError";
	}
}