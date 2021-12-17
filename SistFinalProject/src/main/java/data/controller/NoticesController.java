package data.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView noticesmain(
			@RequestParam (value = "currentPage", defaultValue = "1") int currentPage,
			HttpSession session
			) {
		
		ModelAndView mview = new ModelAndView();
		
		int totalCount = mapper.getTotalCount();
		//페이징처리에 필요한 변수
		
		int totalPage;   //총 페이지수
		int startPage;   //각 블럭의 시작페이지
		int endPage;   //각 블럭의 끝페이지
		int start;   //각페이지의 시작번호
		int perPage=16;  //한페이지에 보여질 글수
		int perBlock=5;  //한페이지에 보여지는 페이지 개수
		//int no;


		//총페이지개수구하기
		totalPage = totalCount/perPage + (totalCount%perPage==0?0:1);

		//각블럭의 시작페이지
		//예: 현재페이지:3, startPage:1,endPage:5
		//예: 현재페이지:6, startPage:6,endPage:10;
		startPage = (currentPage-1)/perBlock*perBlock+1;
		endPage = startPage+perBlock-1;

		//만약 총페이지수가 8일경우
		//2번째 블럭은 start:6, endPage:10되야?
		//이때는 endpage를 8로 수정해준다
		if(endPage>totalPage){
			endPage=totalPage;
		}

		//각 페이지에서 불러올 시작번호
		//현재페이지가 1 일경우 start는 1,  2일 경우6...
		start=(currentPage-1)*perPage;

		//각페이지에서 필요한 게시글 가져오기...dao에서 만든거
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		List<NoticesDto> list = mapper.getListInfo(start, perPage);
		
		
		//각 글앞에 붙힐 시작번호 구하기
		//총글이 20개일경우 1페이지는 20, 2페이지는 15부터
		//출력해서 1씩 감소해가며 출력할것
		//no = totalCount-(currentPage-1)*perPage;

		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("totalPage", totalPage);
		mview.addObject("currentPage", currentPage);
		
		
		
		  String user_id = (String) session.getAttribute("myid"); 
		  for(NoticesDto dto :list) { 
			  
			  int check = mapper.checkScrap(user_id, dto.getNum()); 
			  dto.setCheck(check);
		   
		  }
		 
		
		
		mview.addObject("list", list);
		
		mview.setViewName("/notices/noticesmain");
		return mview;
	}
	
	
	
	@GetMapping("/notices/insertscrap")
	@ResponseBody
	public void insertScrap(
			@RequestParam String user_id,
			@RequestParam String notice_num
			){

		
		mapper.insertScrap(user_id, notice_num);

		
	}
	
	@GetMapping("/notices/deletetscrap")
	@ResponseBody
	public void deleteScrap(
			@RequestParam String user_id,
			@RequestParam String notice_num
			){

		
		mapper.deleteScrap(user_id, notice_num);

		
	}
	
	@GetMapping("/notices/typelist")
	public ModelAndView typeList(
			@RequestParam (value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam String type,
			HttpSession session
			) {
		
		ModelAndView mview = new ModelAndView();
		
		int totalCount = mapper.getTypeCount(type);
		//페이징처리에 필요한 변수
		
		int totalPage;   //총 페이지수
		int startPage;   //각 블럭의 시작페이지
		int endPage;   //각 블럭의 끝페이지
		int start;   //각페이지의 시작번호
		int perPage=16;  //한페이지에 보여질 글수
		int perBlock=5;  //한페이지에 보여지는 페이지 개수
		//int no;


		//총페이지개수구하기
		totalPage = totalCount/perPage + (totalCount%perPage==0?0:1);

		//각블럭의 시작페이지
		//예: 현재페이지:3, startPage:1,endPage:5
		//예: 현재페이지:6, startPage:6,endPage:10;
		startPage = (currentPage-1)/perBlock*perBlock+1;
		endPage = startPage+perBlock-1;

		//만약 총페이지수가 8일경우
		//2번째 블럭은 start:6, endPage:10되야?
		//이때는 endpage를 8로 수정해준다
		if(endPage>totalPage){
			endPage=totalPage;
		}

		//각 페이지에서 불러올 시작번호
		//현재페이지가 1 일경우 start는 1,  2일 경우6...
		start=(currentPage-1)*perPage;

		//각페이지에서 필요한 게시글 가져오기...dao에서 만든거
		
		
		List<NoticesDto> list = mapper.getTypeList(type, start, perPage);
		
		
		
		//각 글앞에 붙힐 시작번호 구하기
		//총글이 20개일경우 1페이지는 20, 2페이지는 15부터
		//출력해서 1씩 감소해가며 출력할것
		//no = totalCount-(currentPage-1)*perPage;

		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("totalPage", totalPage);
		mview.addObject("currentPage", currentPage);
		
		
		String user_id = (String) session.getAttribute("myid");
		for(NoticesDto dto : list) {
			String photo = cmapper.getPhoto(dto.getCompany_id());
			int check = mapper.checkScrap(user_id, dto.getNum());
			dto.setCheck(check);
			dto.setPhoto(photo);
		}
		
		
		mview.addObject("list", list);
		
		mview.setViewName("/notices/noticesmain");
		return mview;
	}
	
	@GetMapping("/notices/detail")
	public ModelAndView noticesDetail(
			@RequestParam String num
			) {
		
		ModelAndView mview = new ModelAndView();
		//NoticesDto dto = mapper.getNotice(num);
		NoticesDto dto = mapper.getNoticeInfo(num);
		
		//D-day
		String endDate = dto.getPeriod_end();
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date(System.currentTimeMillis()));
		String today = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());  //오늘날짜 (yyyy-MM-dd)
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			Date end = new Date(sdf.parse(endDate).getTime());
			Date to = new Date(sdf.parse(today).getTime());
			
			long calculate = end.getTime() - to.getTime();
			
			int dDay = (int) (calculate/(24*60*60*1000));
			mview.addObject("dDay", dDay);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		mview.addObject("dto", dto);
		
		
		
		mview.setViewName("/notices/noticesdetail");
		return mview;
		
	}
	
	
}
