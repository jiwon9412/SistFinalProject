package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticesController {

	@GetMapping("/notices/main")
	public String loginform() {

		return "/notices/noticesmain";
	}
}
