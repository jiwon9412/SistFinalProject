package data.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import data.dto.CompaniesDto;
import data.dto.MypageResumeDto;
import data.dto.OfferDto;
import data.dto.UserDto;
import data.mapper.LoginMapper;
import data.mapper.MypageMapper;
import data.mapper.PositionMapper;

@Controller
public class PositionController {

	@Autowired
	PositionMapper mapper;
	
	@Autowired
	LoginMapper loginmapper;
	
	
	//포지션 메인으로 이동
	//id에 따른 Offer 전체 갯수 출력 & 전체리스트 출력
	@GetMapping("/position/main")
	public String loginform(HttpSession session) {
	
		//넣어줄 Model 생성
		ModelAndView mview = new ModelAndView();
		
		String loginok = (String)session.getAttribute("loginok");
		String logintype = (String)session.getAttribute("logintype");
		
		//만약 로그인 한했을 경우 로그인으로 이동
		if(loginok!=null) {
			
			//유저 로그인인 경우
			if(logintype == "user") {
				
				//포워드
				return "redirect:/position/user";	
				
			} else {
				
				//포워드
				return "redirect:/position/corp";
			}

		} else {
			
			//여기 매우 중요!!! - 로그인 안했을 경우
			//setViewName으로 하면 주소가 그대로 position에 main이 되기에 Redirect로 매핑 주소로 쏴줌
			//그러나 return type이 String형이 아니기때문에 ModelAndView 형식의 Redirect 써줌
			//mview.setView(new RedirectView("/login/main",true));			
			
			return "redirect:/login/main";
		}		
	}
		
	@GetMapping("/position/user")
	public ModelAndView postionUserForm(HttpSession session) {
		
		ModelAndView mview = new ModelAndView();
		
		//id값 식별
		String myid = (String)session.getAttribute("myid");
				
		//로그인 확인
		String loginok = (String)session.getAttribute("loginok");
		
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
		
		mview.setViewName("/position/positionmain");
		
		
		return mview;
	}
	
	
	@GetMapping("/position/corp")
	public ModelAndView postionCorpForm() {
		
		ModelAndView mview = new ModelAndView();
		
		List<UserDto> user_list = mapper.getAllResume();
		
		for(UserDto dto : user_list) {
			if(dto.getIntroduce().length()>=10) {
				String introduce = dto.getIntroduce().substring(0, 13);
				dto.setIntroduce(introduce + "...");
			}
		}
		
		
		mview.addObject("user_list", user_list);
		
		mview.setViewName("/position/positionCorp");
		
		return mview;
		
	}
	
	
	//Offer 삭제
	//실제 학제
	@GetMapping("/position/delete")
	public @ResponseBody void delete(@RequestParam String company_id) {
			
		//dao호출
		mapper.deleteOffer(company_id);
		
	}
	
	//오퍼 하나 가지고 오기
	@GetMapping("/position/getOffer")
	public @ResponseBody HashMap<String, String> getOffer(
			@RequestParam String user_id, 
			@RequestParam String company_id) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("user_id", user_id);
		map.put("company_id", company_id);
		
		OfferDto dto = mapper.getOffer(map);
		
		String content = dto.getContent();
		
		System.out.println(content);
		
		map.put("content", content);
		
		return map;
	}
	
	
	//개인 이력서 열람
	@GetMapping("/position/popIntroduce")
	public String show_introduce(){
		
		return "position/popIntroduce";
	}
}
