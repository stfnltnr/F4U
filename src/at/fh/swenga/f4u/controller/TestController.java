package at.fh.swenga.f4u.controller;

import java.util.List;

import javax.validation.Valid;

import org.fluttercode.datafactory.impl.DataFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import at.fh.swenga.f4u.dao.TestRepository;
import at.fh.swenga.f4u.model.TestModel;

@Controller
public class TestController {
	
	@Autowired
	TestRepository testRepository;
	
	@RequestMapping("/test")
	public String test(Model model) {
		List<TestModel> test = testRepository.findAll();
		model.addAttribute("test", test);
		model.addAttribute("type", "findAll");
		return "test";
	}
	
	@RequestMapping("/fillTest")
	@Transactional
	public String fillData(Model model) {
		DataFactory df = new DataFactory();
		
		for(int i = 0; i <20; i++) {
			String testName = df.getName();
			
			TestModel tm = new TestModel(testName);
			testRepository.save(tm);
		}
		
		return "forward:test";
	}
	
	@RequestMapping(value= "/addTest", method = RequestMethod.GET)
	public String addData(Model model) {
		return "editTest";
	}
	
	@RequestMapping(value = "/addT", method=RequestMethod.POST)
	@Transactional
	public String addT(@Valid @ModelAttribute TestModel newTestModel, BindingResult bindingResult, 
			Model model){
		
		if (bindingResult.hasErrors()) {
			String errorMessage = "";
			for (FieldError fieldError : bindingResult.getFieldErrors()) {
				errorMessage += fieldError.getField() + " is invalid<br>";
			}
			model.addAttribute("errorMessage", errorMessage);
			return "forward:test";
		}
		
		TestModel test = testRepository.findOne(newTestModel.getId());
		
		if(test!=null){
			model.addAttribute("errorMessage", "Test already exists!<br>");
		}
		else {
			TestModel tm = new TestModel();
			tm.setName(newTestModel.getName());
			testRepository.save(tm);
			model.addAttribute("message", "New test " + newTestModel.getId() + " added.");
		}
		
		return "forward:test";
	}
	
	@RequestMapping(value = "/editTest", method = RequestMethod.GET)
	public String editData(Model model, @RequestParam int id) {
		
		TestModel test = testRepository.findOne(id);
		if (test != null) {
			model.addAttribute("test", test);
			return "editTest";
		} else {
			model.addAttribute("errorMessage", "Couldn't find test" + id);
			return "forward:test";
		}		
	}
	
	@RequestMapping(value = "/changeTest", method = RequestMethod.POST)
	@Transactional
	public String editFinance(@Valid @ModelAttribute TestModel editTestModel, BindingResult bindingResult,
			Model model) {
 
		if (bindingResult.hasErrors()) {
			String errorMessage = "";
			for (FieldError fieldError : bindingResult.getFieldErrors()) {
				errorMessage += fieldError.getField() + " is invalid<br>";
			}
			model.addAttribute("errorMessage", errorMessage);
			return "forward:test";
		}
 
		TestModel test = testRepository.findOne(editTestModel.getId());

		if (test == null) {
			model.addAttribute("errorMessage", "Test does not exist!<br>");
		} else {
			test.setId(editTestModel.getId());
			test.setName(editTestModel.getName());
			testRepository.save(test);
			model.addAttribute("message", "Changed test " + editTestModel.getId());
		}
 
		return "forward:test";
	}
	
	@RequestMapping("/deleteTest")
	public String deleteData(Model model, @RequestParam int id) {
		testRepository.delete(id);

		return "forward:test";
	}
	
	public String handleAllException(Exception ex) {
		return "showError";
	}

}
