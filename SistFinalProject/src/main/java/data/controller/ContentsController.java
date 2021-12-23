package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContentsController {

	@GetMapping("/contents/main")
	public String loginform() {

		return "/contents/contentsmain";
	}
	
	// 콘텐츠 메인에서 콘텐츠 디테일로 갈수 있게
	@GetMapping("/contents/detail")
	public ModelAndView contentsdetail(@RequestParam String src)
	{
		ModelAndView mview=new ModelAndView();
			
		mview.addObject("src", src);
			
		mview.setViewName("/contents/contentsdetail");
			
		return mview;
	}
}
