package data.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;

import data.dto.CompaniesDto;
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
			@RequestParam String logintype,
			HttpSession session
			) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pass", pass);
		
		int check = 0;
		
		if(logintype.equals("개인회원")) {
			check = mapper.login(map);
		} else if(logintype.equals("기업회원")){
			check = mapper.corplogin(map);
		}
		
		if(check==1) {
			session.setAttribute("myid", id);
			session.setAttribute("loginok", "yes");
			if(logintype.equals("개인회원")) {
				session.setAttribute("logintype", "user");
			} else if (logintype.equals("기업회원")){
				session.setAttribute("logintype", "corp");
			}
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
	public @ResponseBody Map<String, Integer> corpIdCheckProc(@RequestParam String id) {
		
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
	public String insertCorp(
			@ModelAttribute CompaniesDto dto,
			@RequestParam MultipartFile logoimage,
			@RequestParam ArrayList<MultipartFile> photoimage,
			HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/images");
		
		String photo = "";
		String logo = logoimage.getOriginalFilename();
		
		try {
			logoimage.transferTo(new File(path + "\\" + logo));
		} catch (IllegalStateException | IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		if(photoimage.get(0).getOriginalFilename().equals(""))
			photo = "no";
		else {
			for(MultipartFile f:photoimage) {
				String fName = f.getOriginalFilename();
				photo += fName+",";
				
				//업로드
				try {
					f.transferTo(new File(path + "\\" + fName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch blockz
					e.printStackTrace();
				}
			}
			photo = photo.substring(0, photo.length()-1); //photo 쉼표 제거
		}
		
		//로고 이미지 dto에 저장
		dto.setLogo(logo);
		
		//사진 파일명 저장 (구분기호 , )
		dto.setPhoto(photo);
		
		//날짜 형식으로 저장
		dto.setEstablishment(dto.getBirth1() + "-" + dto.getBirth2() + "-" + dto.getBirth3());
		
		//연락처 형식으로 저장
		dto.setHp(dto.getHp1() + "-" + dto.getHp2() + "-" + dto.getHp3());
		
		
		
		mapper.insertCorp(dto);
		
		return "/login/addsuccess";
	}
}
