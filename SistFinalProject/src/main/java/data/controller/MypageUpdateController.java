package data.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import data.mapper.LoginMapper;

@Controller
public class MypageUpdateController {
	
	@Autowired
	LoginMapper loginmapper;
	
	@PostMapping("/mypage/updateuserpasscheck")
	public String updateUserPassCheck(
			@RequestParam String pass,
			HttpSession session) {
		
		//세션에서 아이디, 로그인 유형
		String myid = (String)session.getAttribute("myid");
		String logintype = (String)session.getAttribute("logintype");
		
		//로그인 확인 위해 map에 저장
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", myid);
		map.put("pass", pass);
		
		//로그인 체크
		int loginCheck = 0;
		if(logintype.equals("user"))
			loginCheck = loginmapper.login(map);
		else if (logintype.equals("corp"))
			loginCheck = loginmapper.corplogin(map);
		
		
		if(loginCheck==1) {
			if(logintype.equals("user")) {
				return "/mypage/updateuserform";
			}
			else {
				return "/mypage/updatecorpform";
			}
		}
			
		else {
			return "/login/passfail";
		}
	}
	
}
