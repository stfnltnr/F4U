//package at.fh.swenga.f4u.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.Pageable;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import at.fh.swenga.f4u.dao.ReportRepository;
//import at.fh.swenga.f4u.dao.UserRepository;
//import at.fh.swenga.f4u.model.ReportModel;
//
//@Controller
//public class ReportController {
//
//	@Autowired
//	ReportRepository reportRepository;
//	
//	@Autowired
//	UserRepository userRepository;
//	
//	@RequestMapping(value = { "/", "list" })
//	public String index(Model model) {
//		List<ReportModel> reports = reportRepository.findAll();
//		model.addAttribute("reports", reports);
//		model.addAttribute("type", "findAll");
//		return "index";
//	}
//	
//	@RequestMapping(value = { "/getPage" }) 
//	public String getPage(Pageable page,Model model) {
//		Page<ReportModel> reports = reportRepository.findAll(page);
//		model.addAttribute("reportsPage", reports); 
//		model.addAttribute("reports", reports.getContent()); 
//		model.addAttribute("type", "findAll");
//		
//		return "index";
//	}
//	
//	@RequestMapping(value = { "/find" })
//	public String find(Model model, @RequestParam String searchString, @ModelAttribute("type")  String type) { 
//		List<ReportModel> reports = null;
//		int count=0;
//		
//		model.addAttribute("reports", reports);
//		model.addAttribute("count", count);
//		return "index";
//	}
//	
//	public String handleAllException(Exception ex) {
//		return "showError";
//	}
//}
