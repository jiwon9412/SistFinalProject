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
	
	@GetMapping("/")
	public String home() {
		
		return "/test/main";
	}
	
	@GetMapping("/test")
	public ModelAndView test() {
		
		ModelAndView mview = new ModelAndView();
		int totalCount = mapper.getTotalCount();
		
		mview.addObject("totalCount", totalCount);
		
		mview.setViewName("/test/test");
		return mview;
	}
	

}
