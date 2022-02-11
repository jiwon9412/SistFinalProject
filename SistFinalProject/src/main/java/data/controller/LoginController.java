package data.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import data.dto.LoginChkDto;
import data.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.dto.CompaniesDto;
import data.dto.UserDto;
import data.mapper.LoginMapper;

@Controller
public class LoginController {

	@Autowired
	LoginMapper mapper;
	
	@Autowired
	private KaKaoService kakaoService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private LoginService loginService;
	
	private String CLIENT_ID = "lAKSwHKCFttsryyK8HWl"; //애플리케이션 클라이언트 아이디값";
	private String CLI_SECRET = "LsHuqKXvaP"; //애플리케이션 클라이언트 시크릿값";
	
	@GetMapping("/login/main")
	public String loginform(HttpSession session, Model model) throws UnsupportedEncodingException {

		String loginok = loginService.getLoginForm(session, model);
		
		if(loginok==null)
			return "/login/loginmain";
		else {
			return "redirect:/mypage/main";
		}
	}
	
	@PostMapping("/login/loginprocess")
	public String loginProcess(@ModelAttribute LoginChkDto dto,
			HttpSession session
			) {

		int loginChk = loginService.LoginProcess(dto, session);
		
		if(loginChk==1) {
			return "redirect:/";
		} else {
			return "/login/passfail";
		}
	}
	
	@GetMapping("/login/logoutprocess")
	public String logout(HttpSession session) {

		session.invalidate(); //세션 모두 제거
		
		return "redirect:main";
	}
	
	@GetMapping("/login/useradd")
	public String useraddform() {
		
		return "/login/useraddform";
	}
	
	//id체크
	@GetMapping("/login/idcheck")
	public @ResponseBody Map<String, Integer> corpIdCheckProc(@RequestParam String id) {
		
		int check = mapper.getIdCheck(id);

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("check", check); // 0 or 1
		
		return map;
	}
	
	@PostMapping("/login/insertuser")
	public ModelAndView insertUser(@ModelAttribute UserDto dto, HttpSession session) {

		ModelAndView mview = loginService.addUser(dto, session);
	
		return mview;
	}
	
	@GetMapping("/login/corpadd")
	public String corpAddForm() {
		
		return "/login/corpaddform";
	}
	
	//id체크
	@GetMapping("/login/corpidcheck")
	public @ResponseBody Map<String, Integer> idCheckProc(@RequestParam String id) {
			
		int check = mapper.getCorpIdCheck(id);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("check", check); // 0 or 1
		
		return map;
	}
	
	@PostMapping("/login/insertcorp")
	public ModelAndView insertCorp(
			@ModelAttribute CompaniesDto dto,
			HttpSession session) {

		ModelAndView mview = loginService.addCorp(dto, session);
		
		return mview;
	}
	
	@GetMapping("/login/addsuccess")
	public ModelAndView addSuccessForm(HttpSession session) {
		
		ModelAndView mview = new ModelAndView();
		
		String type = (String)session.getAttribute("loginType");
		
		mview.setViewName("/login/addsuccess");
		
		return mview;
	}
	
	//카카오 로그인 API
	@RequestMapping("/login/kakaoLogin")
    public String home(@RequestParam(value = "code", required = false) String code, 
    		HttpSession session) throws Exception{
		
        System.out.println("#########" + code);
        String access_Token = kakaoService.getAccessToken(code);
        System.out.println("###access_Token### : " + access_Token);
        HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
        
        String id = (String)userInfo.get("email");
        int idx = id.indexOf("@");
        id = id.substring(0, idx);
        
        String nick = (String)userInfo.get("nickname");
        String email = (String)userInfo.get("email");
        
        if(mapper.getIdCheck(id) == 0) {
        	UserDto dto = new UserDto();
        	dto.setId(id);
            dto.setName(nick);
            dto.setEmail(email);
            mapper.insertUser(dto);
        }
        
        session.setAttribute("nick", nick);
        session.setAttribute("logintype", "user");
        session.setAttribute("snspass", "yes");
        session.setAttribute("loginok", "yes");
        session.setAttribute("myid", id);
        
        return "/login/tomain";
    }
	
}
