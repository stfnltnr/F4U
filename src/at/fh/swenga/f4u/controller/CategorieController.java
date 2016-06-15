package at.fh.swenga.f4u.controller;

import java.util.List;

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
import at.fh.swenga.f4u.model.CategorieModel;

@Controller
public class CategorieController {
	
	@Autowired
	CategorieRepository categorieRepository;
	
	@RequestMapping(value = "/listCat")
	public String index(Model model) {
		List<CategorieModel> categories = categorieRepository.findAll();
		model.addAttribute("categories", categories);
		model.addAttribute("type", "findAll");
		return "listCat";
	}
	
	@RequestMapping("/fillCat")
	@Transactional
	public String fillData(Model model) {
		
		categorieRepository.save(new CategorieModel("Shopping", "All payments regarding shopping", "glyphicon glyphicon-shopping-cart", "#000000",0));
		categorieRepository.save(new CategorieModel("Home", "Outgoings like rent, fixed costs, ...", "glyphicon glyphicon-home", "#000000",0));
		categorieRepository.save(new CategorieModel("Restaurant", "Everything regarding going out for meal", "glyphicon glyphicon-cutlery", "#000000",0));
		categorieRepository.save(new CategorieModel("Nightlife", "All spendings on alcohol and more ...", "glyphicon glyphicon-glass", "#000000",0));
		categorieRepository.save(new CategorieModel("Bills", "Miscellaneous bills", "glyphicon glyphicon-euro", "#000000",0));
		categorieRepository.save(new CategorieModel("Travelling", "All payments related to traveling, vacation, ...","glyphicon glyphicon-plane", "#000000",0));
		categorieRepository.save(new CategorieModel("Miscellaneous", "All miscellaneous payments", "glyphicon glyphicon-question-sign", "#000000",0));
		categorieRepository.save(new CategorieModel("Spar", "all payments at Spar", "glyphicon glyphicon-shopping-cart", "#5cb85c",1));
		categorieRepository.save(new CategorieModel("Hofer", "all payments at Hofer", "glyphicon glyphicon-shopping-cart", "#428bca",1));
		categorieRepository.save(new CategorieModel("Penny Markt", "all payments at Penny", "glyphicon glyphicon-shopping-cart", "#d9534f",1));
		categorieRepository.save(new CategorieModel("Rent", "Rent for flat", "sICON5", "sColor5",2));
		categorieRepository.save(new CategorieModel("Phone", "Mobile bill", "glyphicon glyphicon-phone", "#5cb85c",2));
		categorieRepository.save(new CategorieModel("Internet", "Internet bill", "glyphicon glyphicon-globe", "#428bca",2));

		return "forward:listCat";
	}
	
	@RequestMapping(value="/addCat", method=RequestMethod.GET)
	public String showAddCatForm(Model model){
		List<CategorieModel> cats = categorieRepository.findAll();
		model.addAttribute("cats", cats);
		return "editCat";
	}
	
	@RequestMapping(value="/addCategorie", method=RequestMethod.POST)
	@Transactional
	public String addCatData(@Valid @ModelAttribute CategorieModel newCatModel, BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()){
			String errorMessage = "";
			for(FieldError fieldError : bindingResult.getFieldErrors()){
				errorMessage += fieldError.getField() + " is invalid<br>";
			}
			model.addAttribute("errormessage", errorMessage);
			return "forward:listCat";
		}
		
		CategorieModel cat = categorieRepository.findOne(newCatModel.getId());
		
		if(cat!=null){
			model.addAttribute("errormessage","Subcategorie already exists!<br>");
		} else {
			CategorieModel cm = new CategorieModel();
			cm.setName(newCatModel.getName());
			cm.setDescription(newCatModel.getDescription());
			cm.setColor(newCatModel.getColor());
			cm.setIcon(newCatModel.getIcon());
			cm.setMaincat(newCatModel.getMaincat());
			categorieRepository.save(cm);
			model.addAttribute("message", "New SubCategorie " +newCatModel.getName() + " added!");
		}
		return "forward:listCat";
	}
	
	@RequestMapping(value="/editC", method=RequestMethod.GET)
	public String showEditCatForm(Model model, @RequestParam int id) {
		CategorieModel categorie = categorieRepository.findOne(id);
		if(categorie != null){
			model.addAttribute("categorie", categorie);
			List<CategorieModel> cats = categorieRepository.findAll();
			model.addAttribute("cats", cats);
			return "editCat";
		} else {
			model.addAttribute("errorMessage", "Couldn't find Categorie!");
			return "forward:listCat";
		}
	}
	
	@RequestMapping(value="/editCategorie", method=RequestMethod.POST)
	public String editCatData(@Valid @ModelAttribute CategorieModel editCatModel, BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()) {
			String errorMessage = "";
			for(FieldError fieldError : bindingResult.getFieldErrors()) {
				errorMessage += fieldError.getField() + " is invalid<br>";
			}
			model.addAttribute("errorMessage",errorMessage);
			return "forward:listCat";
		}
		
		CategorieModel cm = categorieRepository.findOne(editCatModel.getId());
		
		if(cm == null){
			model.addAttribute("errorMessage", "Categorie doesn't exist!<br>");
		} else {
			cm.setId(editCatModel.getId());
			cm.setName(editCatModel.getName());
			cm.setDescription(editCatModel.getDescription());
			cm.setColor(editCatModel.getColor());
			cm.setIcon(editCatModel.getIcon());
			cm.setMaincat(editCatModel.getMaincat());
			categorieRepository.save(cm);
			model.addAttribute("message", "Changed categorie " + editCatModel.getName());
		}
		
		return "forward:listCat";

	}
	
	@RequestMapping(value="/deleteCat")
	public String deleteCat(Model model, @RequestParam int id) {
		categorieRepository.delete(id);
		return "forward:listCat";
	}
	
	
	@ExceptionHandler(Exception.class)
	public String handleAllException(Exception ex) {

		return "showError";

	}

}
