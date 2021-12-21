package data.controller;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.dto.CompaniesDto;
import data.dto.NoticesDto;
import data.mapper.CompaniesMapper;

@Controller
public class CompaniesController {

	@Autowired
	CompaniesMapper mapper;
	
	@GetMapping("/companies/main")
	public ModelAndView loginform(
			@RequestParam(value = "currentPage",defaultValue = "1")int currentPage
			) {

		ModelAndView mview=new ModelAndView();
		
		int totalCount=mapper.getTotalCount();
		
		//페이징 처리에 필요한 변수
		int totalPage; //총 페이지 수
		int startPage; //각 블럭의 시작페이지
		int endPage; //각 블럭의 끝페이지
		int start; //각 페이지의 시작번호
		int perPage=8; //한 페이지에 보여질 글의 개수
		int perBlock=5; //한 페이지에 보여지는 페이지 개수

		//총페이지개수구하기
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

		//각블럭의 시작페이지
		//예: 현재페이지:3 startPage:1, endpge=5 
		//예: 현재페이지:6 startPage:6, endpge=10
		startPage=(currentPage-1)/perBlock*perBlock+1;

		endPage=startPage+perBlock-1;

		//만약 총페이지 수가 8일경우 
		//2번재 블럭은 st:6 endPage:10이 되야한다
		//이때는 endPage를 8로 수정해 주어야 한다
		if(endPage>totalPage)
			endPage=totalPage;

		//각페이지에서 불러올시작번호
		//현재페이지가  1 일경우 start는 1,2일경우 6....
		start=(currentPage-1)*perPage;

		//각페이지에서 필요한 게시글 가져오기
		List<CompaniesDto> list=mapper.getList(start, perPage);
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		Date to = cal.getTime();
		String today = sdf.format(to);
		
		ArrayList<CompaniesDto> hlist = mapper.getHireList(today);
		mview.addObject("size", hlist.size());
		
		mview.addObject("hlist", hlist);
		
		//각글앞에 붙힐 시작번호 구하기
		//총글이 20개일겨웅 1페이지 20,2페이지 15부터
		//출력해서 1씩 감소해가면서 출력할것
		//int no=totalCount-(currentPage-1)*perPage;
		
		mview.addObject("list",list);
		mview.addObject("startPage",startPage);
		mview.addObject("endPage",endPage);
		mview.addObject("totalPage",totalPage);
		mview.addObject("currentPage",currentPage);
		mview.addObject("totalCount", totalCount);
		
		
		mview.setViewName("/companies/companiesmain");
		
		return mview;
	}
	
	@GetMapping("/companies/industrylist")
	public ModelAndView majorlist(
			@RequestParam (value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam String industry
			)
	{
		ModelAndView mview = new ModelAndView();
		
		int totalCount=mapper.getIndustryCount(industry);
		
		//페이징 처리에 필요한 변수
		int totalPage; //총 페이지 수
		int startPage; //각 블럭의 시작페이지
		int endPage; //각 블럭의 끝페이지
		int start; //각 페이지의 시작번호
		int perPage=8; //한 페이지에 보여질 글의 개수
		int perBlock=5; //한 페이지에 보여지는 페이지 개수

		//총페이지개수구하기
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

		//각블럭의 시작페이지
		//예: 현재페이지:3 startPage:1, endpge=5 
		//예: 현재페이지:6 startPage:6, endpge=10
		startPage=(currentPage-1)/perBlock*perBlock+1;

		endPage=startPage+perBlock-1;

		//만약 총페이지 수가 8일경우 
		//2번재 블럭은 st:6 endPage:10이 되야한다
		//이때는 endPage를 8로 수정해 주어야 한다
		if(endPage>totalPage)
			endPage=totalPage;

		//각페이지에서 불러올시작번호
		//현재페이지가  1 일경우 start는 1,2일경우 6....
		start=(currentPage-1)*perPage;

		//각페이지에서 필요한 게시글 가져오기
		List<CompaniesDto> list=mapper.getIndustryList(industry, start, perPage);

		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		Date to = cal.getTime();
		String today = sdf.format(to);
		
		ArrayList<CompaniesDto> hlist = mapper.getHireList(today);
		mview.addObject("size", hlist.size());
		
		mview.addObject("hlist", hlist);
		
		//각글앞에 붙힐 시작번호 구하기
		//총글이 20개일겨웅 1페이지 20,2페이지 15부터
		//출력해서 1씩 감소해가면서 출력할것
		//int no=totalCount-(currentPage-1)*perPage;
				
		mview.addObject("list",list);
		mview.addObject("startPage",startPage);
		mview.addObject("endPage",endPage);
		mview.addObject("totalPage",totalPage);
		mview.addObject("currentPage",currentPage);
		mview.addObject("totalCount", totalCount);
				
		mview.setViewName("/companies/companiesmain");
		
		return mview;
	}
	
	// 기업리스트에서 -> 기업선택해서 누르면 상세페이지로 이동하게	
	@GetMapping("/companies/detail")
	public ModelAndView companiesdetail(@RequestParam String id)
	{
		ModelAndView mview=new ModelAndView();
		
		CompaniesDto dto=mapper.getData(id);
		
		//채용중인 기업 리스트
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		Date to = cal.getTime();
		String today = sdf.format(to);
		
		ArrayList<CompaniesDto> hlist = mapper.getHireList(today);
		mview.addObject("size", hlist.size());
		
		mview.addObject("hlist", hlist);
		
		//해당된 기업의 채용중인 공고 리스트
		ArrayList<NoticesDto> onelist=mapper.getOneHireList(today, id);
		mview.addObject("onelist", onelist);
		
		mview.addObject("onesize", onelist.size());
		
		mview.addObject("dto", dto);
		
		mview.setViewName("/companies/companiesdetail");
		
		return mview;
	}
	
	
}
