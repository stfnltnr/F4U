package at.fh.swenga.f4u.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import at.fh.swenga.f4u.dao.CategorieRepository;
import at.fh.swenga.f4u.dao.FinanceRepository;
import at.fh.swenga.f4u.dao.PermanentRepository;
import at.fh.swenga.f4u.dao.UserRepository;
import at.fh.swenga.f4u.model.FinanceModel;

public class FinanceController {

	@Autowired
	FinanceRepository financeRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	PermanentRepository permanentRepository;
	
	@Autowired
	CategorieRepository categorieRepository;
	
	
	
	@RequestMapping(value = { "/", "list"})
	public String index(Model model) {
		List<FinanceModel> finances = financeRepository.findAll();
		model.addAttribute("finances", finances);
		model.addAttribute("type", "findAll");
		return "index";
	}
	
	@RequestMapping(value = { "/getPage" }) 
	public String getPage(Pageable page,Model model) {
		Page<FinanceModel> finances = financeRepository.findAll(page);
		model.addAttribute("financePage", finances);
		model.addAttribute("finances", finances.getContent()); 
		model.addAttribute("type", "findAll");
		return "index";
	}
	
	@RequestMapping(value = { "/find" })
	public String find(Model model, @RequestParam String searchString, @ModelAttribute("type")  String type) { 
		List<FinanceModel> finances = null;
		model.addAttribute("finances", finances);
		return "index";
	}
	
	public String handleAllException(Exception ex) {
		return "showError";
	}
}

