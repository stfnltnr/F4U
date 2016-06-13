package at.fh.swenga.f4u.controller;

import java.util.List;

import org.fluttercode.datafactory.impl.DataFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import at.fh.swenga.f4u.dao.CategorieRepository;
import at.fh.swenga.f4u.dao.SubcategorieRepository;
import at.fh.swenga.f4u.model.CategorieModel;

@Controller
public class CategorieController {
	
	@Autowired
	CategorieRepository categorieRepository;
	
	@Autowired
	SubcategorieRepository subcategorieRepository;
	
	@RequestMapping(value = {"listCat"})
	public String index(Model model) {
		List<CategorieModel> categories = categorieRepository.findAll();
		model.addAttribute("categories", categories);
		model.addAttribute("type", "findAll");
		return "listCat";
	}
	
	@RequestMapping("/fillCat")
	@Transactional
	public String fillData(Model model) {
		
		categorieRepository.save(new CategorieModel("Cat1", "Cat1desc", "ICON1", "Color1"));
		categorieRepository.save(new CategorieModel("Cat2", "Cat2desc", "ICON2", "Color2"));
		categorieRepository.save(new CategorieModel("Cat3", "Cat3desc", "ICON3", "Color3"));
		categorieRepository.save(new CategorieModel("Cat4", "Cat4desc", "ICON4", "Color4"));
		categorieRepository.save(new CategorieModel("Cat5", "Cat5desc", "ICON5", "Color5"));

		return "forward:listCat";
	}
	
	@ExceptionHandler(Exception.class)
	public String handleAllException(Exception ex) {

		return "showError";

	}

}
