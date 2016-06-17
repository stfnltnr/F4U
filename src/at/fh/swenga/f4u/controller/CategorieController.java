package at.fh.swenga.f4u.controller;

import java.util.List;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import at.fh.swenga.f4u.dao.CategorieRepository;
import at.fh.swenga.f4u.dao.FinanceRepository;
import at.fh.swenga.f4u.dao.SubCategorieRepository;
import at.fh.swenga.f4u.model.CategorieModel;
import at.fh.swenga.f4u.model.FinanceModel;
import at.fh.swenga.f4u.model.SubCategorieModel;

@Controller
public class CategorieController {
	
	@Autowired
	CategorieRepository categorieRepository;
	
	@Autowired
	SubCategorieRepository subCategorieRepository;
	
	@Autowired
	FinanceRepository financeRepository;
	
	@RequestMapping(value = "/listCat")
	public String index(Model model) {
		List<CategorieModel> categories = categorieRepository.findAll();
		List<SubCategorieModel> subcategories = subCategorieRepository.findAll();
		model.addAttribute("categories", categories);
		model.addAttribute("subcategories", subcategories);
		model.addAttribute("type", "findAll");
		return "listCat";
	}
	
	@RequestMapping("/fillCat")
	@Transactional
	public String fillData(Model model) {
		// Fill MainCategories
		CategorieModel cat1 = new CategorieModel("Shopping", "All payments regarding shopping", "glyphicon glyphicon-shopping-cart", "#000000");
		categorieRepository.save(cat1);
		
		CategorieModel cat2 = new CategorieModel("Home", "Outgoings like rent, fixed costs, ...", "glyphicon glyphicon-home", "#000000");
		categorieRepository.save(cat2);
		
		CategorieModel cat3 = new CategorieModel("Restaurant", "Everything regarding going out for meal", "glyphicon glyphicon-cutlery", "#000000");
		categorieRepository.save(cat3);
		CategorieModel cat4 = new CategorieModel("Nightlife", "Alcohol and more ...", "glyphicon glyphicon-glass", "#000000");
		categorieRepository.save(cat4);
		CategorieModel cat5 = new CategorieModel("Bills", "Miscellaneous bills", "glyphicon glyphicon-euro", "#000000");
		categorieRepository.save(cat5);
		CategorieModel cat6 = new CategorieModel("Travelling", "All payments related to traveling, vacation, ...","glyphicon glyphicon-plane", "#000000");
		categorieRepository.save(cat6);
		CategorieModel cat7 = new CategorieModel("Miscellaneous", "All miscellaneous payments", "glyphicon glyphicon-question-sign", "#000000");
		categorieRepository.save(cat7);

		// Fill Subcategories
		SubCategorieModel sc1 = new SubCategorieModel("Spar", "all payments at Spar", "glyphicon glyphicon-shopping-cart", "#5cb85c",1);
		sc1.setCategorie(categorieRepository.findOne(1));
		subCategorieRepository.save(sc1);
		SubCategorieModel sc2 = new SubCategorieModel("Hofer", "all payments at Hofer", "glyphicon glyphicon-shopping-cart", "#428bca",1);
		sc2.setCategorie(categorieRepository.findOne(1));
		subCategorieRepository.save(sc2);
		SubCategorieModel sc3 = new SubCategorieModel("Penny Markt", "all payments at Penny", "glyphicon glyphicon-shopping-cart", "#d9534f",1);
		sc3.setCategorie(categorieRepository.findOne(1));
		subCategorieRepository.save(sc3);
		SubCategorieModel sc4 = new SubCategorieModel("Rent", "Rent for flat", "glyphicon glyphicon-home", "#5cb85c",2);
		sc1.setCategorie(categorieRepository.findOne(2));
		subCategorieRepository.save(sc4);
		SubCategorieModel sc5 = new SubCategorieModel("Phone", "Mobile bill", "glyphicon glyphicon-phone", "#5cb85c",2);
		sc2.setCategorie(categorieRepository.findOne(2));
		subCategorieRepository.save(sc5);
		SubCategorieModel sc6 = new SubCategorieModel("Internet", "Internet bill", "glyphicon glyphicon-globe", "#428bca",2);
		sc3.setCategorie(categorieRepository.findOne(2));
		subCategorieRepository.save(sc6);
		
		return "forward:listCat";
	}
	
	@RequestMapping(value="/addCat", method=RequestMethod.GET)
	public String showAddCatForm(Model model){
		List<SubCategorieModel> subcats = subCategorieRepository.findAll();
		List<CategorieModel> cats = categorieRepository.findAll();
		model.addAttribute("subcats", subcats);
		model.addAttribute("cats", cats);
		return "editCat";
	}
	
	@RequestMapping(value="/addCategorie", method=RequestMethod.POST)
	@Transactional
	public String addCatData(@Valid @ModelAttribute SubCategorieModel newCatModel, BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()){
			String errorMessage = "";
			for(FieldError fieldError : bindingResult.getFieldErrors()){
				errorMessage += fieldError.getField() + " is invalid<br>";
			}
			model.addAttribute("errormessage", errorMessage);
			return "forward:listCat";
		}
		
		SubCategorieModel subcat = subCategorieRepository.findOne(newCatModel.getId());
		
		if(subcat!=null){
			model.addAttribute("errormessage","Subcategorie already exists!<br>");
		} else {
			SubCategorieModel cm = new SubCategorieModel();
			cm.setName(newCatModel.getName());
			cm.setDescription(newCatModel.getDescription());
			cm.setColor(newCatModel.getColor());
			cm.setIcon(newCatModel.getIcon());
			cm.setMaincat(newCatModel.getCategorie().getId());
			cm.setCategorie(newCatModel.getCategorie());
			subCategorieRepository.save(cm);
			model.addAttribute("message", "New SubCategorie " +newCatModel.getName() + " added!");
		}
		return "forward:listCat";
	}
	
	@RequestMapping(value="/editC", method=RequestMethod.GET)
	public String showEditCatForm(Model model, @RequestParam int id) {
		SubCategorieModel subcategorie = subCategorieRepository.findOne(id);
		if(subcategorie != null){
			model.addAttribute("subcategorie", subcategorie);
			List<CategorieModel> cats = categorieRepository.findAll();
			model.addAttribute("cats", cats);
			return "editCat";
		} else {
			model.addAttribute("errorMessage", "Couldn't find Categorie!");
			return "forward:listCat";
		}
	}
	
	@RequestMapping(value="/editCategorie", method=RequestMethod.POST)
	public String editCatData(@Valid @ModelAttribute SubCategorieModel editCatModel, BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()) {
			String errorMessage = "";
			for(FieldError fieldError : bindingResult.getFieldErrors()) {
				errorMessage += fieldError.getField() + " is invalid<br>";
			}
			model.addAttribute("errorMessage",errorMessage);
			return "forward:listCat";
		}
		
		SubCategorieModel cm = subCategorieRepository.findOne(editCatModel.getId());
		
		if(cm == null){
			model.addAttribute("errorMessage", "Categorie doesn't exist!<br>");
		} else {
			cm.setId(editCatModel.getId());
			cm.setName(editCatModel.getName());
			cm.setDescription(editCatModel.getDescription());
			cm.setColor(editCatModel.getColor());
			cm.setIcon(editCatModel.getIcon());
			cm.setMaincat(editCatModel.getCategorie().getId());
			cm.setCategorie(editCatModel.getCategorie());
			subCategorieRepository.save(cm);
			model.addAttribute("message", "Changed categorie " + editCatModel.getName());
		}
		
		return "forward:listCat";

	}
	
	@RequestMapping(value="/deleteCat")
	public String deleteCat(Model model, @RequestParam int id) {
		
		
		List<FinanceModel> finances = financeRepository.findBySubcategorieId(id);
		for(int i = 0; i< finances.size();i++) {
			FinanceModel f = finances.get(i);
			f.setId(f.getId());
			f.setPayment(f.isPayment());
			f.setBookDate(f.getBookDate());
			f.setValue(f.getValue());
			f.setNotes(f.getNotes());
			f.setCategorie(f.getCategorie());
			f.setSubcategorie(null);
//			finance.setUser(editFinanceModel.getUser());
			financeRepository.save(f);
		}
		subCategorieRepository.delete(id);
		
		return "forward:listCat";		
	}
		
	@ExceptionHandler(Exception.class)
	public String handleAllException(Exception ex) {

		return "showError";
	}
}
