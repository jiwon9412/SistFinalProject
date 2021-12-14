package data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import data.mapper.TestMapper;

@Controller
public class TestController {
	
	@Autowired
	TestMapper mapper;
	
	@GetMapping("/test12")
	public String home() {
		
		return "/test/main";
	}
	
	@GetMapping("/test")
	public ModelAndView test() {
		
		ModelAndView mview = new ModelAndView();
		
		
		mview.setViewName("/test/test");
		return mview;
	}
	

}
