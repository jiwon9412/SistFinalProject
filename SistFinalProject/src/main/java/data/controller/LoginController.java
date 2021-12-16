package data.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import data.dto.UserDto;
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
		String loginok = (String)session.getAttribute("loginok");
		
		//로그인 타입
		String logintype = (String)session.getAttribute("logintype");
		
		if(loginok==null)
			return "/login/loginmain";
		else {
			return "redirect:/mypage/main";
		}
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
			return "redirect:main";
		} else {
			return "/login/passfail";
		}
	}
	
	@GetMapping("/login/logoutprocess")
	public String logout(HttpSession session) {
		
		session.removeAttribute("myid");
		session.removeAttribute("loginok");
		session.removeAttribute("logintype");
		
		return "redirect:main";
	}
	
	@GetMapping("/login/useradd")
	public String useraddform() {
		
		return "/login/useraddform";
	}
	
	//id체크
	@GetMapping("/login/idcheck")
	public @ResponseBody Map<String, Integer> idCheckProc(@RequestParam String id) {
		
		int check = mapper.getIdCheck(id);

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("check", check); // 0 or 1
		
		return map;
	}
	
	@PostMapping("/login/insertuser")
	public String insertUser(@ModelAttribute UserDto dto) {
		
		//날짜 형식으로 넣어주기
		dto.setBirth(dto.getBirth1() + "-" + dto.getBirth2() + "-" + dto.getBirth3());
		
		//이메일 형식으로 넣어주기
		dto.setEmail(dto.getEmail1()+ "@" + dto.getEmail2());
		
		//연락처 형식으로 넣어주기
		dto.setHp(dto.getHp1() + "-" + dto.getHp2() + "-" + dto.getHp3());
		
		mapper.insertUser(dto);
		
		return "/login/addsuccess";
	}
}
