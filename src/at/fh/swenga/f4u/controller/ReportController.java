package at.fh.swenga.f4u.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import at.fh.swenga.f4u.dao.FinanceRepository;
import at.fh.swenga.f4u.model.FinanceModel;

@Controller
public class ReportController {

	@Autowired
	FinanceRepository financeRepository;
	
//	@Autowired
//	UserRepository userRepository;
	
	@RequestMapping(value = { "/reportAll"})
	public String report(Model model){

			List<FinanceModel> finances = financeRepository.findAll();
			model.addAttribute("finances",finances);
			return "excelReport";
		}
	
//	@RequestMapping(value = { "/reportDate1" })
//	public String reportDate(Model model,
//			@RequestParam Date von, @RequestParam Date bis){
//
//			List<FinanceModel> finances = financeRepository.findAll();
//			model.addAttribute("finances",finances);
//			return "excelReport";
//		}
	
	@RequestMapping(value = { "/reportDate" })
	public String findDate(Model model, @RequestParam Date searchDate1, @RequestParam Date searchDate2) {

		SimpleDateFormat formatter1 = new SimpleDateFormat("dd.MM.yyyy");
		String date1 = formatter1.format(searchDate1);
		
		SimpleDateFormat formatter2 = new SimpleDateFormat("dd.MM.yyyy");
		String date2 = formatter2.format(searchDate2);
		
		List<FinanceModel> finances = null;
		finances = financeRepository.findByDateBetween(searchDate1, searchDate2);
		model.addAttribute("finances", finances);
		return "excelReport";
	}

	@ExceptionHandler(Exception.class)
	public String handleAllException(Exception ex) {
		return "showError";

	}

}
