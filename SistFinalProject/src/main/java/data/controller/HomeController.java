package data.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import data.dto.NoticesDto;
import data.mapper.NoticesMapper;

@Controller
public class HomeController {
	
	@Autowired
	NoticesMapper nmapper;
	
	@GetMapping("/")
	public ModelAndView home() {
		
		ModelAndView mview = new ModelAndView();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date(System.currentTimeMillis()));
		String today =sdf.format(cal.getTime());  //오늘날짜 (yyyy-MM-dd)
		
		ArrayList<NoticesDto> dlist = nmapper.getDeadlineList(today);
		mview.addObject("dlist", dlist);
		
		mview.setViewName("/layout/main");
		return mview;
	}
}
