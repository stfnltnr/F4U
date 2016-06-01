package at.fh.swenga.f4u.controller;

import java.util.ArrayList;
import java.util.Date;
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
import at.fh.swenga.f4u.dao.SubcategorieRepository;
import at.fh.swenga.f4u.dao.UserRepository;
import at.fh.swenga.f4u.model.CategorieModel;
import at.fh.swenga.f4u.model.FinanceModel;
import at.fh.swenga.f4u.model.SubcategorieModel;
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
	SubcategorieRepository subcategorieRepository;

	@RequestMapping(value = { "/", "list" })
	public String index(Model model) {
		List<FinanceModel> finances = financeRepository.findAll();
		model.addAttribute("finances", finances);
		model.addAttribute("type", "findAll");
		System.out.print("hurrerei!!!!!!!!!!!!!!!AAAAAAAAAAAHHHHHHHHHHHHHHHHHHHHHHHHHHH");
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

		case "findByNotes":
			finances = financeRepository.findByNotes(searchString);
			break;

		case "findByCategorieName":
			finances = financeRepository.findByCategorieName(searchString);
			break;

		case "findBySubcategorieName":
			finances = financeRepository.findBySubcategorieName(searchString);
			break;
			
		case "findByUserLastName":
			finances = financeRepository.findByUserLastName(searchString);
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
		SubcategorieModel subcategorie = null;
		UserModel user = null;

		for (int i = 0; i < 10; i++) {
			if (i % 5 == 0) {
				String categorieName = df.getBusinessName();
				String categorieDescribtion = df.getLastName();
				String categorieIcon = df.getRandomChars(2);
				String categorieColor = df.getRandomChars(5);
				categorie = categorieRepository.findFirstByName(categorieName);

				if (categorie == null) {
					categorie = new CategorieModel(categorieName, categorieDescribtion, categorieIcon, categorieColor);
				}
			}

			if (i % 2 == 0) {
				String subcategorieName = df.getBusinessName();
				String subcategorieDescribtion = df.getLastName();
				String subcategorieIcon = df.getRandomChars(2);
				String subcategorieColor = df.getRandomChars(5);
				subcategorie = subcategorieRepository.findFirstByName(subcategorieName);

				if (subcategorie == null) {
					subcategorie = new SubcategorieModel(subcategorieName, subcategorieDescribtion, subcategorieIcon,
							subcategorieColor);
				}
			}
			
				String userFirstName = df.getFirstName();
				String userLastName = df.getLastName();
				String userAddress = df.getStreetName();
				int userPostCode = 8010;
				String userPlace = df.getCity();
				String userPhone = df.getNumberText(8);
				String userEmail = df.getEmailAddress();
				Date userDayOfBirth = df.getBirthDate();
				user = userRepository.findFirstByLastName(userLastName);

				if (user == null) {
					user = new UserModel(userFirstName, userLastName, userAddress, userPostCode, userPlace,userPhone,
							userEmail, userDayOfBirth);
				}
			
			FinanceModel fm = new FinanceModel(true, false, 2000.0, df.getFirstName());
			fm.setCategorie(categorie);
			fm.setSubcategorie(subcategorie);
			fm.setUser(user);
			financeRepository.save(fm);
		}
System.out.print("leck mich du sau");
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
		System.out.print(finance);
		
		if(finance!=null){
			model.addAttribute("errorMessage", "Finance already exists!<br>");
		}
		else {
			FinanceModel fm = new FinanceModel();
//			fm.setId(newFinanceModel.getId());
			fm.setIncoming(newFinanceModel.isIncoming());
			fm.setOutgoing(newFinanceModel.isOutgoing());
//			fm.setBookDate(newFinanceModel.getBookDate());
			fm.setValue(newFinanceModel.getValue());
			fm.setNotes(newFinanceModel.getNotes());
			financeRepository.save(fm);
			model.addAttribute("message", "New finance " + newFinanceModel.getId() + " added.");
		}
		
		return "forward:list";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String showEditFinanceForm(Model model, @RequestParam int id) {

		FinanceModel finance = financeRepository.findOne(id);		
		if (finance!=null) {
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
			finance.setIncoming(editFinanceModel.isIncoming());
			finance.setOutgoing(editFinanceModel.isOutgoing());
//			finance.setBookDate(editFinanceModel.getBookDate());
			finance.setValue(editFinanceModel.getValue());
			finance.setNotes(editFinanceModel.getNotes());
//			finance.setCategorie(editFinanceModel.getCategorie());
//			finance.setSubcategorie(editFinanceModel.getSubcategorie());
//			finance.setUser(editFinanceModel.getUser());
			financeRepository.save(finance);
			model.addAttribute("message", "Changed finance " + editFinanceModel.getId());
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