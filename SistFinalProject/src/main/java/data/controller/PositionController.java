package data.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@Autowired
	MypageMapper mymapper;
	
	
	//포지션 메인으로 이동
	//id에 따른 Offer 전체 갯수 출력 & 전체리스트 출력
	@GetMapping("/position/main")
	public String loginform(HttpSession session) {
	
		//넣어줄 Model 생성
		ModelAndView mview = new ModelAndView();
		
		//메뉴 세션값 
		session.removeAttribute("pageName");
		session.setAttribute("pageName", "position");
		
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
		for(OfferDto dto : list) {
			if(dto.getContent().length()>=10) {
				String shortContent = dto.getContent().substring(0, 13);
				dto.setShortContent(shortContent + "...");
			}else {
				dto.setShortContent(dto.getContent());
			}
			String newContent = dto.getContent().replace("\n", "<br>");
			dto.setContent(newContent);
		}
				
		//랜덤 출력용
		List<CompaniesDto> list2 = mapper.getRndList();
				
		//총 갯수 + list 넣어주기
		mview.addObject("totalPosition", totalPosition);
		mview.addObject("list",list);
		mview.addObject("list2",list2);
		
		mview.setViewName("/position/positionmain");
		
		
		return mview;
	}
	
	
	//회사가 개인 회원들 볼 수 있게하기
	@GetMapping("/position/corp")
	public ModelAndView postionCorpForm(HttpSession session) {
		
		ModelAndView mview = new ModelAndView();
		
		String myid = (String)session.getAttribute("myid");
		
		List<UserDto> user_list = mapper.getAllResume(myid);
		
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
	//클릭할 경우 그 개인 아이디로 넘어가야함
	@GetMapping("/position/popIntroduce")
	public ModelAndView show_introduce(@RequestParam String user_id){
		
		//클릭할 경우 아이디 - 기업으로 로그인된 상태이므로 각 회원 아이디를 가져와야함 - resumedto 얻어오기
		MypageResumeDto rdto = mymapper.getMypageResume(user_id); 
		
		System.out.println(user_id);

		// 자격증 분리 후 리스트에 담기
		List<String> license1 = new ArrayList<String>();
		List<String> license2 = new ArrayList<String>();
		List<String> license3 = new ArrayList<String>();

		
		String[] licenseList = rdto.getLicense().split("\\|");
		for (int i = 0; i < licenseList.length; i++) {
			// System.out.println("licenseList["+i+"]"+licenseList[i]);
			String[] licenseList2 = licenseList[i].split("`");
			for (int j = 0; j < 1; j++) {
				// System.out.println("licenseList2[" + j + "]" + licenseList2[j]);
				license1.add(licenseList2[0]);
				license2.add(licenseList2[1]);
				license3.add(licenseList2[2]);
			}
		}	

		// 대외활동 분리 후 리스트에 담기
		List<String> activity1 = new ArrayList<String>();
		List<String> activity2 = new ArrayList<String>();
		List<String> activity3 = new ArrayList<String>();

		// System.out.println("getactivity: "+rdto.getactivity());
		String[] activityList = rdto.getActivity().split("\\|");
		for (int i = 0; i < activityList.length; i++) {
			// System.out.println("activityList["+i+"]"+activityList[i]);
			String[] activityList2 = activityList[i].split("`");
			for (int j = 0; j < 1; j++) {
				// System.out.println("activityList2[" + j + "]" + activityList2[j]);
				activity1.add(activityList2[0]);
				activity2.add(activityList2[1]);
				activity3.add(activityList2[2]);
			}
		}

		// 경력 분리 후 리스트에 담기
		List<String> career1 = new ArrayList<String>();
		List<String> career2 = new ArrayList<String>();
		List<String> career3 = new ArrayList<String>();
		List<String> career4 = new ArrayList<String>();
		List<String> career5 = new ArrayList<String>();

		// System.out.println("getcareer: "+rdto.getcareer());
		String[] careerList = rdto.getCareer().split("\\|");
		for (int i = 0; i < careerList.length; i++) {
			// System.out.println("careerList["+i+"]"+careerList[i]);
			String[] careerList2 = careerList[i].split("`");
			for (int j = 0; j < 1; j++) {
				// System.out.println("careerList2[" + j + "]" + careerList2[j]);
				career1.add(careerList2[0]);
				career2.add(careerList2[1]);
				career3.add(careerList2[2]);
				career4.add(careerList2[3]);
				career5.add(careerList2[4]);
			}
		}

		String[] hi = rdto.getHighschool().split("`");
		rdto.setHighschool1(hi[0]);
		rdto.setHighschool2(hi[1]);
		rdto.setHighschool3(hi[2]);
		String[] co = rdto.getCollege().split("`");
		rdto.setCollege1(co[0]);
		rdto.setCollege2(co[1]);
		rdto.setCollege3(co[2]);

		ModelAndView mv = new ModelAndView();
		
		mv.addObject("license1", license1);
		mv.addObject("license2", license2);
		mv.addObject("license3", license3);
		mv.addObject("activity1", activity1);
		mv.addObject("activity2", activity2);
		mv.addObject("activity3", activity3);
		mv.addObject("career1", career1);
		mv.addObject("career2", career2);
		mv.addObject("career3", career3);
		mv.addObject("career4", career4);
		mv.addObject("career5", career5);
		mv.addObject("resumedto", rdto);
		mv.setViewName("/1/position/popIntroduce");

		return mv;
	}
	
	
	//제안하기 - insert Offer
	//ResponseBody 없으면 DB에는 들어가도 404나 405 뜬다
	@PostMapping("/position/insertOffer")
	public @ResponseBody void insertOffer(@ModelAttribute OfferDto dto) {
		
		mapper.insertOffer(dto);
	}
	
	
}
