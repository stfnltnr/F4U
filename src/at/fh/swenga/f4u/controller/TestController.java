package at.fh.swenga.f4u.controller;

import java.util.List;

import org.fluttercode.datafactory.impl.DataFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import at.fh.swenga.f4u.dao.TestRepository;
import at.fh.swenga.f4u.model.TestModel;

@Controller
public class TestController {
	
	@Autowired
	TestRepository testRepository;
	
	@RequestMapping("/test")
	public String index(Model model) {
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
	
	@RequestMapping("/test2")
	public String addData(Model model) {
		
		return "test2";
		
	}
	
	@RequestMapping("/editTest")
	public String editData(Model model, @RequestParam int id) {
		
		TestModel test = testRepository.findOne(id);
		model.addAttribute(test);
		return "editTest";
		
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
