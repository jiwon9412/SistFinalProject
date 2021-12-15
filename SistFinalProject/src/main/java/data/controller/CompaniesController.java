package data.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import data.dto.CompaniesDto;
import data.mapper.CompaniesMapper;

@Controller
public class CompaniesController {

	@Autowired
	CompaniesMapper mapper;
	
	@GetMapping("/companies/main")
	public ModelAndView loginform(
			
			) {

		ModelAndView mview=new ModelAndView();
		
		int totalCount=mapper.getTotalCount();
		
		List<CompaniesDto> list=mapper.getList();
		
		mview.addObject("list", list);
		
		mview.addObject("totalCount", totalCount);
		
		mview.setViewName("/companies/companiesmain");
		
		return mview;
	}
}
