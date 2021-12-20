package data.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.dto.CompaniesDto;
import data.dto.UserDto;
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
				return "redirect:updateuserform";
			}
			else {
				return "redirect:updatecorpform";
			}
		}
			
		else 
			return "/login/passfail";
		
	}
	
	@GetMapping("/mypage/updateuserform")
	public ModelAndView updateUserForm(HttpSession session) {
		
		ModelAndView mview = new ModelAndView();
		
		//세션에서 아이디, 로그인 유형
		String myid = (String)session.getAttribute("myid");
		
		UserDto dto = loginmapper.getUserData(myid);
		
		mview.addObject("dto", dto);
		mview.setViewName("/mypage/updateuserform");
		
		return mview;
	}
	
	@GetMapping("/mypage/updatecorpform")
	public ModelAndView updateCorpForm(HttpSession session) {
		
		ModelAndView mview = new ModelAndView();
		
		//세션에서 아이디, 로그인 유형
		String myid = (String)session.getAttribute("myid");
				
		CompaniesDto dto = loginmapper.getCorpData(myid);
		
		if(dto.getHp()!=null) {
		String[] hp = dto.getHp().split("-");
		dto.setHp1(hp[0]);
		dto.setHp2(hp[1]);
		dto.setHp3(hp[2]);
		}
		
		if(dto.getInsurance()!=null) {
		String[] ins = dto.getInsurance().split(",");
		dto.setIns1(ins[0]);
		dto.setIns2(ins[1]);
		dto.setIns3(ins[2]);
		dto.setIns4(ins[3]);
		}
		
		if(dto.getEstablishment()!=null) {
		String[] est = dto.getEstablishment().split(". ");
		dto.setBirth1(est[0]);
		dto.setBirth2(est[1]);
		dto.setBirth3(est[2]);
		}
				
		mview.addObject("dto", dto);
		mview.setViewName("/mypage/updatecorpform");
		
		return mview;
	}
	
	@PostMapping("/mypage/updatecorpproc")
	public String updateCorpProc(
			@ModelAttribute CompaniesDto dto,
			@RequestParam MultipartFile logoimage,
			@RequestParam ArrayList<MultipartFile> photoimage,
			HttpSession session
			) {
		
		String path = session.getServletContext().getRealPath("/images");
		
		String photo = "";
		String logo = logoimage.getOriginalFilename();
		
		if(logo.equals(""))
			logo = "no";
		else {
			try {
				logoimage.transferTo(new File(path + "\\" + logo));
			} catch (IllegalStateException | IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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
		
		String[] type = {"선택안함", "서비스업", "금융은행업", "IT·정보통신산업", "판매·유통업", "제조·생산·화학업", "미디어·광고업", "기관·협회"};
		for(int i=0; i<type.length; i++) {
			if(dto.getIndustry().equals(Integer.toString(i)))
				dto.setIndustry(type[i]);
		}
		
		//로고 이미지 dto에 저장
		dto.setLogo(logo);
		
		//사진 파일명 저장 (구분기호 , )
		dto.setPhoto(photo);
		
		//날짜 형식으로 저장
		dto.setEstablishment(dto.getBirth1() + ". " + dto.getBirth2() + ". " + dto.getBirth3());
		
		//연락처 형식으로 저장
		dto.setHp(dto.getHp1() + "-" + dto.getHp2() + "-" + dto.getHp3());
		
		//ID지정
		dto.setId((String)session.getAttribute("myid"));
		
		
		loginmapper.updateCorp(dto);
		
		return "redirect:/mypage/main";
	}
	
}
