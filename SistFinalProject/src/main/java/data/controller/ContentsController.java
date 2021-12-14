package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ContentsController {

	@GetMapping("/contents/main")
	public String loginform() {

		return "/contents/contentsmain";
	}
}
