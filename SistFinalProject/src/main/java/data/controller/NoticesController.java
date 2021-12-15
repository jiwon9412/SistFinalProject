package data.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import data.dto.NoticesDto;
import data.mapper.NoticesMapper;

@Controller
public class NoticesController {
	
	@Autowired
	NoticesMapper mapper;
	
	@GetMapping("/notices/main")
	public ModelAndView noticesmain() {
		
		ModelAndView mview = new ModelAndView();
		ArrayList<NoticesDto> list = mapper.getAllNotices();
		mview.addObject("list", list);
		
		mview.setViewName("/notices/noticesmain");
		return mview;
	}
}
