package at.fh.swenga.f4u.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.fluttercode.datafactory.impl.DataFactory;
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
	
	// LOGIN
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String handleLogin() {
		return "login";
	}

	@RequestMapping(value = { "/", "list" })
	public String index(Model model) {
		List<FinanceModel> finances = financeRepository.findAll();
		model.addAttribute("finances", finances);
		model.addAttribute("type", "findAll");
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
			
		case "findByUserLastName":
			finances = financeRepository.findByUserLastName(searchString);
			break;
		}
		model.addAttribute("finances", finances);
		return "index";
	}

	@RequestMapping(value = { "/findValue" })
	public String findValue(Model model, @RequestParam double searchValue, @ModelAttribute("type") String type) {
		List<FinanceModel> finances = null;

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
	
	@RequestMapping("/fill")
	@Transactional
	public String fillData(Model model) {

		DataFactory df = new DataFactory();
		CategorieModel categorie = null;
		UserModel user = null;
		

		for (int i = 0; i < 5; i++) {
			categorie = new CategorieModel("TestCategorie", "Description", "glyphicon glyphicon-shopping-cart", "#000000");
			
				String userFirstName = df.getFirstName();
				String userLastName = df.getLastName();
				String userAddress = df.getStreetName();
				int userPostCode = 8010;
				String userPlace = df.getCity();
				String userPhone = df.getNumberText(8);
				String userEmail = df.getEmailAddress();
				user = userRepository.findFirstByLastName(userLastName);

				if (user == null) {
					user = new UserModel(userFirstName, userLastName, userAddress, userPostCode, userPlace,userPhone,
							userEmail);
				}
			
			FinanceModel fm = new FinanceModel(df.chance(50), df.getBirthDate(), df.getNumberBetween(1, 2000), df.getFirstName());
			fm.setCategorie(categorie);
			fm.setUser(user);
			financeRepository.save(fm);
		}
		return "forward:list";
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
			List<CategorieModel> cats = categorieRepository.findAll();
			List<SubCategorieModel> subcats = subCategorieRepository.findAll();
			model.addAttribute("cats", cats);
			model.addAttribute("subcats",subcats);
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