package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {

	@GetMapping("/mypage/main")
	public String loginform() {

		return "/mypage/mypagemain";
	}
}
