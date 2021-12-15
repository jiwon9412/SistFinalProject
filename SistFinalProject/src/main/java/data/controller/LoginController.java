package data.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import data.mapper.LoginMapper;

@Controller
public class LoginController {

	@Autowired
	LoginMapper mapper;
	
	@GetMapping("/login/main")
	public String loginform(HttpSession session) {

		//아이디
		String myid = (String)session.getAttribute("myid");
		
		//로그인 확인
		String logintype = (String)session.getAttribute("logintype");
		
		if(logintype==null)
			return "/login/loginmain";
		else {
			
			return "/login/mypage";
		}
	}

	
	@GetMapping("/login/home")
	public String home() {
		
		return "/layout/main";
	}
	
	@PostMapping("/login/loginprocess")
	public String loginProcess(
			@RequestParam String id,
			@RequestParam String pass,
			HttpSession session
			) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pass", pass);
		
		int check = mapper.login(map);
		
		if(check==1) {
			session.setAttribute("myid", id);
			session.setAttribute("loginok", "yes");
			session.setAttribute("logintype", "user");
			
			//체크했을때 on, 안하면 null
			return "redirect:home";
		} else {
			return "/login/passfail";
		}
	}
	
	@GetMapping("/login/logoutprocess")
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginok");
		
		return "redirect:main";
	}
	
	@GetMapping("/login/useradd")
	public String useraddform() {
		
		return "/login/useraddform";
	}
}
