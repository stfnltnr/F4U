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
	
	@RequestMapping(value = {"listCategories"})
	public String index(Model model) {
		List<CategorieModel> categories = categorieRepository.findAll();
		model.addAttribute("categories", categories);
		model.addAttribute("type", "findAll");
		return "index";
	}
	
	@RequestMapping("/fill")
	@Transactional
	public String fillData(Model model) {
		
		DataFactory df = new DataFactory();
		CategorieModel categorie = null; 
		
		
		for(int i=0; i<10; i++) {
			// to do!!			
		}

		return "forward:list";
	}
	
	@ExceptionHandler(Exception.class)
	public String handleAllException(Exception ex) {

		return "showError";

	}

}
