package data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.dto.MypageResumeDto;
import data.mapper.MypageMapper;

@Controller
public class MypageController {
	
	@Autowired
	MypageMapper mymapper;

	@GetMapping("/mypage/main")
	public ModelAndView resumeview(@RequestParam String loginok, @RequestParam String user_id) {
		System.out.println(loginok+","+user_id);
		ModelAndView mv = new ModelAndView();
		
		//로그인여부(loginok)가 yes일 때, 로그인한아이디(user_id)가져와서 resumedto 얻어오기 
		//if (loginok == "yes") {
		if(mymapper.checkResume(user_id)!=0) {
			MypageResumeDto resumedto = mymapper.getMypageResume(user_id);
			
			//학력,경력,자격증,대외활동 분리 후 다시 dto에 담기
			String [] li = resumedto.getLicense().split("`");
			resumedto.setLicense1(li[0]);
			resumedto.setLicense2(li[1]);
			resumedto.setLicense3(li[2]);
			String [] hi = resumedto.getHighschool().split("`");
			resumedto.setHighschool1(hi[0]);
			resumedto.setHighschool2(hi[1]);
			resumedto.setHighschool3(hi[2]);
			String [] co = resumedto.getCollege().split("`");
			resumedto.setCollege1(co[0]);
			resumedto.setCollege2(co[1]);
			resumedto.setCollege3(co[2]);
			String [] ac = resumedto.getActivity().split("`");
			resumedto.setActivity1(ac[0]);
			resumedto.setActivity2(ac[1]);
			resumedto.setActivity3(ac[2]);
			String [] ca = resumedto.getCareer().split("`");
			resumedto.setCareer1(ca[0]);
			resumedto.setCareer2(ca[1]);
			resumedto.setCareer3(ca[2]);
			resumedto.setCareer4(ca[3]);
			resumedto.setCareer5(ca[4]);
			
			mv.addObject("resumedto", resumedto);
			mv.setViewName("/mypage/resumeview");
		}else{
			mv.setViewName("/mypage/resumeupdate");
			
		}
		//} else {
		//	mv.setViewName("/mypage/pleaselogin"); //로그인창으로 가게 바꿀 예정
		//}
		
		return mv;		
	}
	
	@GetMapping("/mypage/resume_update")
	public ModelAndView updateform(@RequestParam String user_id) {

		ModelAndView mv = new ModelAndView();
		MypageResumeDto resumedto = mymapper.getMypageResume(user_id);
		
		mv.addObject("resumedto", resumedto);
		mv.setViewName("/mypage/resumeupdate");
		return mv;
	}
	
	
	@GetMapping("/mypage/updateuser")
	public String updateuser() {
		
		return "/mypage/updateuser";
	}
	
	@GetMapping("/mypage/updatecompany")
	public String updatecompany() {
		
		return "/mypage/updatecompany";
	}
	
	
}
