package data.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.dto.MypageResumeDto;
import data.dto.UserDto;
import data.mapper.MypageMapper;

@Controller
public class MypageController {
	
	@Autowired
	MypageMapper mymapper;
/*
	@GetMapping("/mypage/main")
	public String resumeview() {

		return "/mypage/resumeview";
	}
	*/
	
	@GetMapping("/mypage/main")
	public ModelAndView resumeview(@RequestParam String loginok, @RequestParam String user_id) {
		System.out.println("[main, resumeview] loginok:"+ loginok + ", user_id:" + user_id);
		ModelAndView mv = new ModelAndView();

		// 로그인여부(loginok)가 yes일 때, 로그인한아이디(user_id)가져와서 resumedto 얻어오기
		if (loginok != "") {
			System.out.println("loginok=yes");
			if (mymapper.checkResume(user_id) != 0) {
				MypageResumeDto rdto = mymapper.getMypageResume(user_id);

				// 학력,경력,자격증,대외활동 분리 후 다시 dto에 담기
				String[] li = rdto.getLicense().split("`");
				rdto.setLicense1(li[0]);
				rdto.setLicense2(li[1]);
				rdto.setLicense3(li[2]);
				String[] hi = rdto.getHighschool().split("`");
				rdto.setHighschool1(hi[0]);
				rdto.setHighschool2(hi[1]);
				rdto.setHighschool3(hi[2]);
				String[] co = rdto.getCollege().split("`");
				rdto.setCollege1(co[0]);
				rdto.setCollege2(co[1]);
				rdto.setCollege3(co[2]);
				String[] ac = rdto.getActivity().split("`");
				rdto.setActivity1(ac[0]);
				rdto.setActivity2(ac[1]);
				rdto.setActivity3(ac[2]);
				String[] ca = rdto.getCareer().split("`");
				rdto.setCareer1(ca[0]);
				rdto.setCareer2(ca[1]);
				rdto.setCareer3(ca[2]);
				rdto.setCareer4(ca[3]);
				rdto.setCareer5(ca[4]);

				mv.addObject("resumedto", rdto);
				mv.setViewName("/mypage/resumeview");
			} else {
				mv.setViewName("resume_write_map");
			}
		} else {
			System.out.println("loginok!=yes");
			mv.setViewName("/mypage/pleaselogin"); // 로그인창으로 가게 바꿀 예정
		}

		return mv;
	}
	
	@GetMapping("/mypage/resume_write_map")
	public ModelAndView write(@RequestParam String user_id) {
		
		ModelAndView mv = new ModelAndView();
		
		UserDto udto = new UserDto(); //아이디 이용해 user정보 가져오게 바꿀 예정
		MypageResumeDto rdto = mymapper.getMypageResume(user_id);
		//System.out.println(user_id);
		
		udto.setName("username");
		udto.setBirth("userbirth");
		udto.setHp("userhp");
		udto.setEmail("useremail");
		//udto.setGender("gender"); //userdto에 gender 없는거 물어보기
		
		mv.addObject("resumedto",rdto);
		mv.addObject("userdto",udto);
		mv.setViewName("/mypage/resumewrite");
		
		return mv;
	}
	
	@PostMapping("/mypage/resume_insert")
	public String insert(@ModelAttribute MypageResumeDto rdto,
			HttpSession session) {
		
		// 세션 만료됐을 경우를 위해 다시한번 loginok 얻기
		String loginok = (String) session.getAttribute("loginok");

		UserDto udto = new UserDto(); //아이디 이용해 user정보 가져오게 바꿀 예정
/*
		// 업로드할 폴더 지정
		String path = session.getServletContext().getRealPath("/photo");
		System.out.println(path);

		// 업로드할 파일명
		if (rdto.getUpload().getOriginalFilename().equals(""))
			rdto.setUploadfile("no");
		else {
			String uploadfile = rdto.getUpload().getOriginalFilename();
			rdto.setUploadfile(uploadfile);

			// 실제 업로드
			try {
				rdto.getUpload().transferTo(new File(path + "\\" + uploadfile));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		*/
		// 세션에서 id 얻어서 dto에 저장
		String myid = (String) session.getAttribute("myid");
		System.out.println("[resume_insert] loginok:"+ loginok + ", myid:" + myid);
		rdto.setUser_id(myid);
		
		rdto.setName("이름작성테스트");
		rdto.setBirth("작성테스트");
		rdto.setGender("작성테스트");
		rdto.setHp("작성테스트");
		rdto.setEmail("작성테스트");

		rdto.setLicense(rdto.getLicense1()+"`"+rdto.getLicense2()+"`"+rdto.getLicense3());
		rdto.setHighschool(rdto.getHighschool1()+"`"+rdto.getHighschool2()+"`"+rdto.getHighschool3());
		rdto.setCollege(rdto.getCollege1()+"`"+rdto.getCollege2()+"`"+rdto.getCollege3()+"`");
		rdto.setActivity(rdto.getActivity1()+"`"+rdto.getActivity2()+"`"+rdto.getActivity3()+"`");
		rdto.setCareer(rdto.getCareer1()+"`"+rdto.getCareer2()+"`"+rdto.getCareer3()+"`"+rdto.getCareer4()+"`"+rdto.getCareer5()+"`");
		
		//insert
		mymapper.insertMypageResume(rdto);
		
		return "redirect:main?user_id="+myid+"&loginok=yes"+loginok; 
	}
	
	@GetMapping("/mypage/resume_update")
	public ModelAndView updateform(@RequestParam String user_id) {

		ModelAndView mv = new ModelAndView();
		
		UserDto udto = new UserDto(); //아이디 이용해 user정보 가져오게 바꿀 예정
		MypageResumeDto rdto = mymapper.getMypageResume(user_id);
		//System.out.println(user_id);
		
		udto.setName("username");
		udto.setBirth("userbirth");
		udto.setHp("userhp");
		udto.setEmail("useremail");
		//udto.setGender("gender"); //userdto에 gender 없는거 물어보기		

		// 학력,경력,자격증,대외활동 분리 후 다시 dto에 담기
		String[] li = rdto.getLicense().split("`");
		rdto.setLicense1(li[0]);
		rdto.setLicense2(li[1]);
		rdto.setLicense3(li[2]);
		String[] hi = rdto.getHighschool().split("`");
		rdto.setHighschool1(hi[0]);
		rdto.setHighschool2(hi[1]);
		rdto.setHighschool3(hi[2]);
		String[] co = rdto.getCollege().split("`");
		rdto.setCollege1(co[0]);
		rdto.setCollege2(co[1]);
		rdto.setCollege3(co[2]);
		String[] ac = rdto.getActivity().split("`");
		rdto.setActivity1(ac[0]);
		rdto.setActivity2(ac[1]);
		rdto.setActivity3(ac[2]);
		String[] ca = rdto.getCareer().split("`");
		rdto.setCareer1(ca[0]);
		rdto.setCareer2(ca[1]);
		rdto.setCareer3(ca[2]);
		rdto.setCareer4(ca[3]);
		rdto.setCareer5(ca[4]);
		
		mv.addObject("resumedto", rdto);
		mv.addObject("userdto",udto);
		mv.setViewName("/mypage/resumeupdate");
		return mv;
	}
	
	@PostMapping("/mypage/resume_update")
	public String update(@ModelAttribute MypageResumeDto rdto,
			@RequestParam String loginok, @RequestParam String user_id) {
		System.out.println("[resume_update] user_id:"+user_id+", loginok:"+loginok);
		/*
		// 업로드할 폴더 지정
		String path = session.getServletContext().getRealPath("/images");
		
		// 업로드할 파일명
		if (rdto.getUploadportfolio().getOriginalFilename().equals(""))
			rdto.setPortfolio(null);
		else {
			String uploadfile = rdto.getUploadportfolio().getOriginalFilename();
			rdto.setPortfolio(uploadfile);

			// 실제 업로드
			try {
				rdto.getUploadportfolio().transferTo(new File(path + "\\" + uploadfile));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		*/
		rdto.setLicense(rdto.getLicense1()+"`"+rdto.getLicense2()+"`"+rdto.getLicense3());
		rdto.setHighschool(rdto.getHighschool1()+"`"+rdto.getHighschool2()+"`"+rdto.getHighschool3());
		rdto.setCollege(rdto.getCollege1()+"`"+rdto.getCollege2()+"`"+rdto.getCollege3()+"`");
		rdto.setActivity(rdto.getActivity1()+"`"+rdto.getActivity2()+"`"+rdto.getActivity3()+"`");
		rdto.setCareer(rdto.getCareer1()+"`"+rdto.getCareer2()+"`"+rdto.getCareer3()+"`"+rdto.getCareer4()+"`"+rdto.getCareer5()+"`");
				
		//update
		mymapper.updateMypageResume(rdto);

		return "redirect:main?user_id="+user_id+"&loginok="+loginok; 
	}
	
	
	
	@GetMapping("/mypage/updateuser")
	public String updateuser() {
		
		return "/mypage/updateuser";
	}
	
	@GetMapping("/mypage/updatecompany")
	public String updatecompany() {
		
		return "/mypage/updatecompany";
	}
	
	
}
