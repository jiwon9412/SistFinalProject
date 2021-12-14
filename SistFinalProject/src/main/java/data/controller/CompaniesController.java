package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CompaniesController {

	@GetMapping("/companies/main")
	public String loginform() {

		return "/companies/companiesmain";
	}
}
