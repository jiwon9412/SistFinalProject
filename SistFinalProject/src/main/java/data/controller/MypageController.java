package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {

	@GetMapping("/mypage/main")
	public String loginform() {

		return "/mypage/mypagemain";
	}
	
	@GetMapping("/mypage/resume")
	public String resume() {
		
		return "/mypage/resume";
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
