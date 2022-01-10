package data.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContentsController {

	@GetMapping("/contents/main")
	public String loginform(HttpSession session) {

		//메뉴 세션값 
		session.removeAttribute("pageName");
		session.setAttribute("pageName", "content");
		
		return "/contents/contentsmain";
	}
	
	// 콘텐츠 메인에서 콘텐츠 디테일로 갈수 있게
	@GetMapping("/contents/detail")
	public ModelAndView contentsdetail(@RequestParam String src,@RequestParam String subjects, @RequestParam String contents, HttpSession session)
	{
		ModelAndView mview=new ModelAndView();
			
		mview.addObject("src", src);			//각각 주소 담기
		mview.addObject("subjects", subjects);	//각각 제목 담기	
		mview.addObject("contents", contents);	//각각 내용 담기
			
		mview.setViewName("/contents/contentsdetail");
		
		//메뉴 세션값 
		session.removeAttribute("pageName");
		session.setAttribute("pageName", "content");
		
		return mview;
	}
}
