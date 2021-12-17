package data.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.dto.CompaniesDto;
import data.dto.MypageResumeDto;
import data.dto.NoticesDto;
import data.dto.UserDto;
import data.mapper.CompaniesMapper;
import data.mapper.LoginMapper;
import data.mapper.MypageMapper;
import data.mapper.NoticesMapper;

@Controller
public class MypageController {
	
	@Autowired
	MypageMapper mymapper;
	
	@Autowired
	LoginMapper loginmapper;
	
	@Autowired
	NoticesMapper nomapper;

	@Autowired
	CompaniesMapper comapper;
	
	@GetMapping("/mypage/main")
	public ModelAndView resumeview(HttpSession session) {
		
		String loginok = (String) session.getAttribute("loginok");
		String myid = (String) session.getAttribute("myid");
		String logintype = (String) session.getAttribute("logintype");

		System.out.println("[mypagemain(login/noticelist/resumeview)] loginok:" + loginok + ", id:" + myid + ", logintype:" + logintype);

		ModelAndView mv = new ModelAndView();

		if (loginok != null) { // 로그인 했을 때
			//System.out.println("loginok=yes");
			if (logintype == "user") { // 개인 로그인
				System.out.println(mymapper.checkResume(myid));
				if (mymapper.checkResume(myid) != 0) { // 로그인한 개인아이디에 이력서 있으면 이력서 보기 페이지로
					MypageResumeDto rdto = mymapper.getMypageResume(myid); // 로그인한아이디(myid)가져와서 resumedto 얻어오기

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
				} else { // 로그인한 개인아이디에 이력서 없으면 이력서 작성 페이지로
					mv.setViewName("resume_write_map");
				}
			} else { // 기업 로그인
				mv.setViewName("noticelist_map");
			}
		} else { // 로그인 안했을 때
			System.out.println("loginok==null");
			mv.setViewName("redirect:../login/main");
		}

		return mv;
	}
	
	@GetMapping("/mypage/noticelist_map") //NoticesController 복사해오기
	public ModelAndView noticelist(@RequestParam (value = "currentPage", defaultValue = "1") int currentPage,
			HttpSession session) {
		//System.out.println("noticelist_map");
		
		ModelAndView mview = new ModelAndView();
		
		int totalCount = nomapper.getTotalCount();
		//페이징처리에 필요한 변수
		
		int totalPage;   //총 페이지수
		int startPage;   //각 블럭의 시작페이지
		int endPage;   //각 블럭의 끝페이지
		int start;   //각페이지의 시작번호
		int perPage=16;  //한페이지에 보여질 글수
		int perBlock=5;  //한페이지에 보여지는 페이지 개수
		//int no;


		//총페이지개수구하기
		totalPage = totalCount/perPage + (totalCount%perPage==0?0:1);

		//각블럭의 시작페이지
		//예: 현재페이지:3, startPage:1,endPage:5
		//예: 현재페이지:6, startPage:6,endPage:10;
		startPage = (currentPage-1)/perBlock*perBlock+1;
		endPage = startPage+perBlock-1;

		//만약 총페이지수가 8일경우
		//2번째 블럭은 start:6, endPage:10되야?
		//이때는 endpage를 8로 수정해준다
		if(endPage>totalPage){
			endPage=totalPage;
		}

		//각 페이지에서 불러올 시작번호
		//현재페이지가 1 일경우 start는 1,  2일 경우6...
		start=(currentPage-1)*perPage;

		//각페이지에서 필요한 게시글 가져오기...dao에서 만든거
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		List<NoticesDto> list = nomapper.getList(start, perPage);
		
		
		//각 글앞에 붙힐 시작번호 구하기
		//총글이 20개일경우 1페이지는 20, 2페이지는 15부터
		//출력해서 1씩 감소해가며 출력할것
		//no = totalCount-(currentPage-1)*perPage;

		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("totalPage", totalPage);
		mview.addObject("currentPage", currentPage);
		
		
		String user_id = (String) session.getAttribute("myid");
		for(NoticesDto dto : list) {
			String photo = comapper.getPhoto(dto.getCompany_id());
			int check = nomapper.checkScrap(user_id, dto.getNum());
			dto.setCheck(check);
			dto.setPhoto(photo);
		}
		
		
		mview.addObject("list", list);
		
		mview.setViewName("/mypage/mynoticelist");
		return mview;
	}
	
	@GetMapping("/mypage/resume_write_map")
	public ModelAndView resumewrite(HttpSession session) {
		String myid = (String) session.getAttribute("myid");
		
		ModelAndView mv = new ModelAndView();
		
		UserDto udto = loginmapper.getUserData(myid);
		//System.out.println("resume_write_map : "+user_id);
		
		mv.addObject("userdto",udto);
		mv.setViewName("/mypage/resumewrite");
		
		return mv;
	}
	
	@GetMapping("/mypage/notice_write_map")
	public String noticewrite() {
		
		return "/mypage/mynoticewrite";
	}
	
	
	@PostMapping("/mypage/resume_insert")
	public String insert(@ModelAttribute MypageResumeDto rdto,
			HttpSession session) {
		
		// 세션 만료됐을 경우를 위해 다시한번 loginok 얻기
		String loginok = (String) session.getAttribute("loginok");

		// 세션에서 id 얻어서 dto에 저장
		String myid = (String) session.getAttribute("myid");
		UserDto udto = loginmapper.getUserData(myid);
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
		System.out.println("[resume_insert] loginok:"+ loginok + ", id:" + myid);
		rdto.setUser_id(myid);

		rdto.setName(udto.getName());
		rdto.setBirth(udto.getBirth());
		rdto.setGender(udto.getGender());
		rdto.setHp(udto.getHp());
		rdto.setEmail(udto.getEmail());
		rdto.setAddr(udto.getAddr());
		
		rdto.setLicense(rdto.getLicense1()+"`"+rdto.getLicense2()+"`"+rdto.getLicense3());
		rdto.setHighschool(rdto.getHighschool1()+"`"+rdto.getHighschool2()+"`"+rdto.getHighschool3());
		rdto.setCollege(rdto.getCollege1()+"`"+rdto.getCollege2()+"`"+rdto.getCollege3()+"`");
		rdto.setActivity(rdto.getActivity1()+"`"+rdto.getActivity2()+"`"+rdto.getActivity3()+"`");
		rdto.setCareer(rdto.getCareer1()+"`"+rdto.getCareer2()+"`"+rdto.getCareer3()+"`"+rdto.getCareer4()+"`"+rdto.getCareer5()+"`");
		
		//insert
		mymapper.insertMypageResume(rdto);
		
		return "redirect:main"; 
	}
	
	@PostMapping("/mypage/notice_insert")
	public String notice_insert(@ModelAttribute NoticesDto ndto,
			HttpSession session) {
		
		// 세션 만료됐을 경우를 위해 다시한번 loginok 얻기
		String loginok = (String) session.getAttribute("loginok");
		
		// 세션에서 id 얻어서 dto에 저장
		String myid = (String) session.getAttribute("myid");
		UserDto udto = loginmapper.getUserData(myid);
		
		System.out.println("[notice_insert] loginok:"+ loginok + ", id:" + myid);
		
		
		//insert
		mymapper.insertMypageNotice(ndto);
		
		return "redirect:main"; 
	}
	
	@GetMapping("/mypage/resume_update_form")
	public ModelAndView updateform(HttpSession session) {
		
		String myid = (String) session.getAttribute("myid");
		MypageResumeDto rdto = mymapper.getMypageResume(myid);
		//System.out.println(user_id);

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
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("resumedto", rdto);
		mv.setViewName("/mypage/resumeupdate");
		return mv;
	}
	
	@PostMapping("/mypage/resume_update")
	public String update(@ModelAttribute MypageResumeDto rdto,
			HttpSession session) {
		
		String loginok = (String) session.getAttribute("loginok");
		String myid = (String) session.getAttribute("myid");
		
		System.out.println("[resume_update] user_id:"+myid+", loginok:"+loginok);
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

		return "redirect:main"; 
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
