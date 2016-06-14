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
		
		categorieRepository.save(new CategorieModel("Cat1", "Cat1desc", "ICON1", "Color1",0));
		categorieRepository.save(new CategorieModel("Cat2", "Cat2desc", "ICON2", "Color2",0));
		categorieRepository.save(new CategorieModel("Cat3", "Cat3desc", "ICON3", "Color3",0));
		categorieRepository.save(new CategorieModel("Cat4", "Cat4desc", "ICON4", "Color4",0));
		categorieRepository.save(new CategorieModel("Cat5", "Cat5desc", "ICON5", "Color5",0));
		categorieRepository.save(new CategorieModel("sCat1", "sCat1desc", "sICON1", "sColor1",1));
		categorieRepository.save(new CategorieModel("sCat2", "sCat2desc", "sICON2", "sColor2",2));
		categorieRepository.save(new CategorieModel("sCat3", "sCat3desc", "sICON3", "sColor3",3));
		categorieRepository.save(new CategorieModel("sCat4", "sCat4desc", "sICON4", "sColor4",4));
		categorieRepository.save(new CategorieModel("sCat5", "sCat5desc", "sICON5", "sColor5",5));
		categorieRepository.save(new CategorieModel("sCat6", "sCat6desc", "sICON6", "sColor6",1));
		categorieRepository.save(new CategorieModel("sCat7", "sCat7desc", "sICON7", "sColor7",2));
		categorieRepository.save(new CategorieModel("sCat8", "sCat8desc", "sICON8", "sColor8",3));
		categorieRepository.save(new CategorieModel("sCat9", "sCat9desc", "sICON9", "sColor9",4));
		categorieRepository.save(new CategorieModel("sCat10", "sCat10desc", "sICON10", "sColor10",5));

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
			cm.setColor(editCatModel.getIcon());
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
