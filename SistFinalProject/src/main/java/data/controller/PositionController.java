package data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Redirect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import data.dto.CompaniesDto;
import data.dto.OfferDto;
import data.mapper.PositionMapper;

@Controller
public class PositionController {

	@Autowired
	PositionMapper mapper;
	
	
	//포지션 메인으로 이동
	//id에 따른 Offer 전체 갯수 출력 & 전체리스트 출력
	@GetMapping("/position/main")
	public ModelAndView loginform(HttpSession session) {
		
		//id값 식별
		String myid = (String)session.getAttribute("myid");
		
		//로그인 확인
		String loginok = (String)session.getAttribute("loginok");
						
		//로그인 타입
		String logintype = (String)session.getAttribute("logintype");

		
		//넣어줄 Model 생성
		ModelAndView mview = new ModelAndView();
		
		
		//총 포지션 제안수
		int totalPosition = mapper.getTotalOffers(myid);
		
		//id값에 해당되는 Offer 전체출력
		List<OfferDto> list = mapper.getAllOffers(myid);
		
		//랜덤 출력용
		List<CompaniesDto> list2 = mapper.getRndList();
		
		//총 갯수 + list 넣어주기
		mview.addObject("totalPosition", totalPosition);
		mview.addObject("list",list);
		mview.addObject("list2",list2);
		
		//만약 로그인 한했을 경우 로그인으로 이동
		if(loginok==null) {
			
			//여기 매우 중요!!!
			//setViewName으로 하면 주소가 그대로 position에 main이 되기에 Redirect로 매핑 주소로 쏴줌
			//그러나 return type이 String형이 아니기때문에 ModelAndView 형식의 Redirect 써줌
			mview.setView(new RedirectView("/login/main",true));
			
		} else {
			//포워드
			mview.setViewName("/position/positionmain");
		}

		
		return mview;
	}
		
}
