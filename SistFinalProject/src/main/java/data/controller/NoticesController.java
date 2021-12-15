package data.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import data.dto.NoticesDto;
import data.mapper.CompaniesMapper;
import data.mapper.NoticesMapper;

@Controller
public class NoticesController {
	
	@Autowired
	NoticesMapper mapper;
	
	@Autowired
	CompaniesMapper cmapper;
	
	@GetMapping("/notices/main")
	public ModelAndView noticesmain() {
		
		ModelAndView mview = new ModelAndView();
		ArrayList<NoticesDto> list = mapper.getAllNotices();
		
		for(NoticesDto dto : list) {
			String photo = cmapper.getPhoto(dto.getCompany_id());
			dto.setPhoto(photo);
		}
		
		
		mview.addObject("list", list);
		
		mview.setViewName("/notices/noticesmain");
		return mview;
	}
}
