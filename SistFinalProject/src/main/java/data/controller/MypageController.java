package data.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	public ModelAndView mypagemain(HttpSession session) {

		String loginok = (String) session.getAttribute("loginok");
		String myid = (String) session.getAttribute("myid");
		String logintype = (String) session.getAttribute("logintype");
		System.out.println("[mypagemain(login/noticelist/resumeview)] loginok:" + loginok + ", id:" + myid
				+ ", logintype:" + logintype);

		ModelAndView mv = new ModelAndView();

		if (loginok != null) { // 로그인 했을 때
			// System.out.println("loginok=yes");
			if (logintype == "user") { // 개인 로그인
				// System.out.println(mymapper.checkResume(myid));
				if (mymapper.checkResume(myid) != 0) { // 로그인한 개인아이디에 이력서 있으면 이력서 보기 페이지로
					mv.setViewName("redirect:resume_view_map");
				} else { // 로그인한 개인아이디에 이력서 없으면 이력서 작성 페이지로
					mv.setViewName("redirect:resume_write_map");
				}
			} else if (logintype == "corp") { // 기업 로그인
				mv.setViewName("redirect:noticelist_map");
			}
		} else { // 로그인 안했을 때
			//System.out.println("loginok==null");
			mv.setViewName("redirect:../login/main");
		}
		return mv;
	}
	
	//이력서 보기 페이지
	@GetMapping("/mypage/resume_view_map")
	public ModelAndView resumeview(HttpSession session) {

		String myid = (String) session.getAttribute("myid");
		MypageResumeDto rdto = mymapper.getMypageResume(myid); // 로그인한아이디(myid)가져와서 resumedto 얻어오기

		// 자격증 분리 후 리스트에 담기
		List<String> license1 = new ArrayList<String>();
		List<String> license2 = new ArrayList<String>();
		List<String> license3 = new ArrayList<String>();

		// System.out.println("getLicense: "+rdto.getLicense());
		String[] licenseList = rdto.getLicense().split("\\|");
		for (int i = 0; i < licenseList.length; i++) {
			// System.out.println("licenseList["+i+"]"+licenseList[i]);
			String[] licenseList2 = licenseList[i].split("`");
			for (int j = 0; j < 1; j++) {
				// System.out.println("licenseList2[" + j + "]" + licenseList2[j]);
				license1.add(licenseList2[0]);
				license2.add(licenseList2[1]);
				license3.add(licenseList2[2]);
			}
		}
//		System.out.println("license1: "+license1);
//		System.out.println("license2: "+license2);
//		System.out.println("license3: "+license3);		

		// 대외활동 분리 후 리스트에 담기
		List<String> activity1 = new ArrayList<String>();
		List<String> activity2 = new ArrayList<String>();
		List<String> activity3 = new ArrayList<String>();

		// System.out.println("getactivity: "+rdto.getactivity());
		String[] activityList = rdto.getActivity().split("\\|");
		for (int i = 0; i < activityList.length; i++) {
			// System.out.println("activityList["+i+"]"+activityList[i]);
			String[] activityList2 = activityList[i].split("`");
			for (int j = 0; j < 1; j++) {
				// System.out.println("activityList2[" + j + "]" + activityList2[j]);
				activity1.add(activityList2[0]);
				activity2.add(activityList2[1]);
				activity3.add(activityList2[2]);
			}
		}
//		System.out.println("activity1: "+activity1);
//		System.out.println("activity2: "+activity2);
//		System.out.println("activity3: "+activity3);

		// 경력 분리 후 리스트에 담기
		List<String> career1 = new ArrayList<String>();
		List<String> career2 = new ArrayList<String>();
		List<String> career3 = new ArrayList<String>();
		List<String> career4 = new ArrayList<String>();
		List<String> career5 = new ArrayList<String>();

		// System.out.println("getcareer: "+rdto.getcareer());
		String[] careerList = rdto.getCareer().split("\\|");
		for (int i = 0; i < careerList.length; i++) {
			// System.out.println("careerList["+i+"]"+careerList[i]);
			String[] careerList2 = careerList[i].split("`");
			for (int j = 0; j < 1; j++) {
				// System.out.println("careerList2[" + j + "]" + careerList2[j]);
				career1.add(careerList2[0]);
				career2.add(careerList2[1]);
				career3.add(careerList2[2]);
				career4.add(careerList2[3]);
				career5.add(careerList2[4]);
			}
		}
//		System.out.println("career1: "+career1);
//		System.out.println("career2: "+career2);
//		System.out.println("career3: "+career3);
//		System.out.println("career4: "+career4);
//		System.out.println("career5: "+career5);

		String[] hi = rdto.getHighschool().split("`");
		rdto.setHighschool1(hi[0]);
		rdto.setHighschool2(hi[1]);
		rdto.setHighschool3(hi[2]);
		String[] co = rdto.getCollege().split("`");
		rdto.setCollege1(co[0]);
		rdto.setCollege2(co[1]);
		rdto.setCollege3(co[2]);

		ModelAndView mv = new ModelAndView();
		
		mv.addObject("license1", license1);
		mv.addObject("license2", license2);
		mv.addObject("license3", license3);
		mv.addObject("activity1", activity1);
		mv.addObject("activity2", activity2);
		mv.addObject("activity3", activity3);
		mv.addObject("career1", career1);
		mv.addObject("career2", career2);
		mv.addObject("career3", career3);
		mv.addObject("career4", career4);
		mv.addObject("career5", career5);
		mv.addObject("resumedto", rdto);
		mv.setViewName("/mypage/resumeview");

		return mv;
	}
	
	//공고리스트 가기
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
		
		
		String myid = (String) session.getAttribute("myid");
		for(NoticesDto dto : list) {
			String photo = comapper.getPhoto(dto.getCompany_id());
			int check = nomapper.checkScrap(myid, dto.getNum());
			dto.setCheck(check);
			dto.setPhoto(photo);
		}
		
		
		mview.addObject("list", list);
		
		int noticesCount = mymapper.getNoticeCountByCompany(myid);
		mview.addObject("noticesCount",noticesCount);
		mview.setViewName("/mypage/mynoticelist");
		return mview;
	}
	
	//이력서 작성 폼으로 가기
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
	
	// 공고 작성 폼으로 가기
	@GetMapping("/mypage/notice_write_map")
	public String noticewrite() {
		
		return "/mypage/mynoticewrite";
	}
	
	// 이력서 등록
	@PostMapping("/mypage/resume_insert")
	public String insert(@ModelAttribute MypageResumeDto rdto,
			@RequestParam MultipartFile rphoto,
			@RequestParam List<String> license1,
			@RequestParam List<String> license2,
			@RequestParam List<String> license3,
			@RequestParam List<String> activity1,
			@RequestParam List<String> activity2,
			@RequestParam List<String> activity3,
			@RequestParam List<String> career1,
			@RequestParam List<String> career2,
			@RequestParam List<String> career3,
			@RequestParam List<String> career4,
			@RequestParam List<String> career5,
			HttpSession session) {
		
		// 세션 만료됐을 경우를 위해 다시한번 loginok 얻기
		String loginok = (String) session.getAttribute("loginok");

		// 세션에서 id 얻어서 dto에 저장
		String myid = (String) session.getAttribute("myid");
//		UserDto udto = loginmapper.getUserData(myid);

		// 업로드할 폴더 지정
		String path = session.getServletContext().getRealPath("/images");
		System.out.println("path: "+path);

		// 사진 업로드
		if (rphoto.getOriginalFilename().equals(""))
			rdto.setPhoto("no");
		else {
			rdto.setPhoto(rphoto.getOriginalFilename());
			try {
				rphoto.transferTo(new File(path + "\\" + rphoto.getOriginalFilename()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		// 포트폴리오 업로드
		if (rdto.getUploadportfolio().getOriginalFilename().equals(""))
			rdto.setPortfolio("no");
		else {
			rdto.setPortfolio(rdto.getUploadportfolio().getOriginalFilename());
			try {
				rdto.getUploadportfolio().transferTo(new File(path + "\\" + rdto.getUploadportfolio().getOriginalFilename()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("[resume_insert] loginok:"+ loginok + ", id:" + myid);
		rdto.setUser_id(myid);

//		rdto.setName(udto.getName());
//		rdto.setBirth(udto.getBirth());
//		rdto.setGender(udto.getGender());
//		rdto.setHp(udto.getHp());
//		rdto.setEmail(udto.getEmail());
//		rdto.setAddr(udto.getAddr());
		
		//rdto.setLicense(rdto.getLicense1()+"`"+rdto.getLicense2()+"`"+rdto.getLicense3());
		rdto.setHighschool(rdto.getHighschool1()+"`"+rdto.getHighschool2()+"`"+rdto.getHighschool3());
		rdto.setCollege(rdto.getCollege1()+"`"+rdto.getCollege2()+"`"+rdto.getCollege3()+"`");
		
		//license 세 항목 합쳐서 스트링 형태로 rdto에 넣기
		rdto.setLicense1(license1);
		rdto.setLicense2(license2);
		rdto.setLicense3(license3);
		String licenseStr = "";
		for (int i = 0; i < license1.size(); i++) {
			licenseStr += license1.get(i) + "`";
			licenseStr += license2.get(i) + "`";
			licenseStr += license3.get(i) + "|";
		}
		licenseStr.substring(0, licenseStr.length() - 1);
		rdto.setLicense(licenseStr);
		
		//activity 세 항목 합쳐서 스트링 형태로 rdto에 넣기
		rdto.setActivity1(activity1);
		rdto.setActivity2(activity2);
		rdto.setActivity3(activity3);
		String activityStr = "";
		for (int i = 0; i < activity1.size(); i++) {
			activityStr += activity1.get(i) + "`";
			activityStr += activity2.get(i) + "`";
			activityStr += activity3.get(i) + "|";
		}
		activityStr.substring(0, activityStr.length() - 1);
		rdto.setActivity(activityStr);
		
		//career 다섯 항목 합쳐서 스트링 형태로 rdto에 넣기
		rdto.setCareer1(career1);
		rdto.setCareer2(career2);
		rdto.setCareer3(career3);
		rdto.setCareer3(career4);
		rdto.setCareer3(career5);
		String careerStr = "";
		for (int i = 0; i < career1.size(); i++) {
			careerStr += career1.get(i) + "`";
			careerStr += career2.get(i) + "`";
			careerStr += career3.get(i) + "`";
			careerStr += career4.get(i) + "`";
			careerStr += career5.get(i) + "|";
		}
		careerStr.substring(0, careerStr.length() - 1);
		rdto.setCareer(careerStr);
		
//		System.out.println("license(set): "+licenseStr);
//		System.out.println("license1: "+license1);
//		System.out.println("license2: "+license2);
//		System.out.println("license3: "+license3);
		//insert
		mymapper.insertMypageResume(rdto);
		
		return "redirect:main"; 
	}
	
	// 공고 등록
	@PostMapping("/mypage/notice_insert")
	public String notice_insert(@ModelAttribute NoticesDto ndto,
			@RequestParam List<String> qualification,
			@RequestParam List<String> preference,
			@RequestParam List<String> task,
			HttpSession session) {
		
		// 세션 만료됐을 경우를 위해 다시한번 loginok 얻기
		String loginok = (String) session.getAttribute("loginok");
		
		// 세션에서 id 얻어서 dto에 저장
		String myid = (String) session.getAttribute("myid");
		System.out.println("[notice_insert] loginok:"+ loginok + ", id:" + myid);

		// qualification 합쳐서 스트링 형태로 ndto에 넣기
		String qualificationStr = "";
		for (int i = 0; i < qualification.size(); i++) {
			qualificationStr += qualification.get(i) + " - ";
		}
		qualificationStr = qualificationStr.substring(0, qualificationStr.length() - 3);
		ndto.setQualification(qualificationStr);
		
		// preference 합쳐서 스트링 형태로 ndto에 넣기
		String preferenceStr = "";
		for (int i = 0; i < preference.size(); i++) {
			preferenceStr += preference.get(i) + " - ";
		}
		preferenceStr=preferenceStr.substring(0, preferenceStr.length() - 3);
		ndto.setPreference(preferenceStr);
		
		// task 합쳐서 스트링 형태로 ndto에 넣기
		String taskStr = "";
		for (int i = 0; i < task.size(); i++) {
			taskStr += task.get(i) + " - ";
		}
		taskStr=taskStr.substring(0, taskStr.length() - 3);
		ndto.setTask(taskStr);		
		
		ndto.setCompany_id(myid);
		
		//insert
		mymapper.insertMypageNotice(ndto);
		
		return "redirect:main"; 
	}
	
	// 이력서 수정 폼으로 가기
	@GetMapping("/mypage/resume_update_form")
	public ModelAndView updateresumeform(HttpSession session) {
		
		String myid = (String) session.getAttribute("myid");
		MypageResumeDto rdto = mymapper.getMypageResume(myid);
		
		// 자격증 분리 후 리스트에 담기
				List<String> license1 = new ArrayList<String>();
				List<String> license2 = new ArrayList<String>();
				List<String> license3 = new ArrayList<String>();

				// System.out.println("getLicense: "+rdto.getLicense());
				String[] licenseList = rdto.getLicense().split("\\|");
				for (int i = 0; i < licenseList.length; i++) {
					// System.out.println("licenseList["+i+"]"+licenseList[i]);
					String[] licenseList2 = licenseList[i].split("`");
					for (int j = 0; j < 1; j++) {
						// System.out.println("licenseList2[" + j + "]" + licenseList2[j]);
						license1.add(licenseList2[0]);
						license2.add(licenseList2[1]);
						license3.add(licenseList2[2]);
					}
				}
//				System.out.println("license1: "+license1);
//				System.out.println("license2: "+license2);
//				System.out.println("license3: "+license3);		

				// 대외활동 분리 후 리스트에 담기
				List<String> activity1 = new ArrayList<String>();
				List<String> activity2 = new ArrayList<String>();
				List<String> activity3 = new ArrayList<String>();

				// System.out.println("getactivity: "+rdto.getactivity());
				String[] activityList = rdto.getActivity().split("\\|");
				for (int i = 0; i < activityList.length; i++) {
					// System.out.println("activityList["+i+"]"+activityList[i]);
					String[] activityList2 = activityList[i].split("`");
					for (int j = 0; j < 1; j++) {
						// System.out.println("activityList2[" + j + "]" + activityList2[j]);
						activity1.add(activityList2[0]);
						activity2.add(activityList2[1]);
						activity3.add(activityList2[2]);
					}
				}
//				System.out.println("activity1: "+activity1);
//				System.out.println("activity2: "+activity2);
//				System.out.println("activity3: "+activity3);

				// 경력 분리 후 리스트에 담기
				List<String> career1 = new ArrayList<String>();
				List<String> career2 = new ArrayList<String>();
				List<String> career3 = new ArrayList<String>();
				List<String> career4 = new ArrayList<String>();
				List<String> career5 = new ArrayList<String>();

				// System.out.println("getcareer: "+rdto.getcareer());
				String[] careerList = rdto.getCareer().split("\\|");
				for (int i = 0; i < careerList.length; i++) {
					// System.out.println("careerList["+i+"]"+careerList[i]);
					String[] careerList2 = careerList[i].split("`");
					for (int j = 0; j < 1; j++) {
						// System.out.println("careerList2[" + j + "]" + careerList2[j]);
						career1.add(careerList2[0]);
						career2.add(careerList2[1]);
						career3.add(careerList2[2]);
						career4.add(careerList2[3]);
						career5.add(careerList2[4]);
					}
				}
//				System.out.println("career1: "+career1);
//				System.out.println("career2: "+career2);
//				System.out.println("career3: "+career3);
//				System.out.println("career4: "+career4);
//				System.out.println("career5: "+career5);
				
		// 학력 분리 후 다시 dto에 담기
		String[] hi = rdto.getHighschool().split("`");
		rdto.setHighschool1(hi[0]);
		rdto.setHighschool2(hi[1]);
		rdto.setHighschool3(hi[2]);
		String[] co = rdto.getCollege().split("`");
		rdto.setCollege1(co[0]);
		rdto.setCollege2(co[1]);
		rdto.setCollege3(co[2]);

		UserDto udto = loginmapper.getUserData(myid);
				
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("license1", license1);
		mv.addObject("license2", license2);
		mv.addObject("license3", license3);
		mv.addObject("activity1", activity1);
		mv.addObject("activity2", activity2);
		mv.addObject("activity3", activity3);
		mv.addObject("career1", career1);
		mv.addObject("career2", career2);
		mv.addObject("career3", career3);
		mv.addObject("career4", career4);
		mv.addObject("career5", career5);
		mv.addObject("userdto", udto);
		mv.addObject("resumedto", rdto);
		mv.setViewName("/mypage/resumeupdate");
		return mv;
	}
	
	// 이력서 수정
	@PostMapping("/mypage/resume_update")
	public String update(@ModelAttribute MypageResumeDto rdto,
			@RequestParam MultipartFile rphoto,
			@RequestParam List<String> license1,
			@RequestParam List<String> license2,
			@RequestParam List<String> license3,
			@RequestParam List<String> activity1,
			@RequestParam List<String> activity2,
			@RequestParam List<String> activity3,
			@RequestParam List<String> career1,
			@RequestParam List<String> career2,
			@RequestParam List<String> career3,
			@RequestParam List<String> career4,
			@RequestParam List<String> career5,
			HttpSession session) {
		
		String loginok = (String) session.getAttribute("loginok");
		String myid = (String) session.getAttribute("myid");
		
		System.out.println("[resume_update] user_id:"+myid+", loginok:"+loginok);
		
		// 업로드할 폴더 지정
		String path = session.getServletContext().getRealPath("/images");
		System.out.println("path: "+path);

		// 사진 업로드
		if (rphoto.getOriginalFilename().equals(""))
			rdto.setPhoto("no");
		else {
			rdto.setPhoto(rphoto.getOriginalFilename());
			try {
				rphoto.transferTo(new File(path + "\\" + rphoto.getOriginalFilename()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
				
		// 포트폴리오 업로드
		if (rdto.getUploadportfolio().getOriginalFilename().equals(""))
			rdto.setPortfolio("no");
		else {
			rdto.setPortfolio(rdto.getUploadportfolio().getOriginalFilename());
			try {
				rdto.getUploadportfolio().transferTo(new File(path + "\\" + rdto.getUploadportfolio().getOriginalFilename()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}

		rdto.setUser_id(myid);
		rdto.setHighschool(rdto.getHighschool1()+"`"+rdto.getHighschool2()+"`"+rdto.getHighschool3());
		rdto.setCollege(rdto.getCollege1()+"`"+rdto.getCollege2()+"`"+rdto.getCollege3()+"`");

		//license 세 항목 합쳐서 스트링 형태로 rdto에 넣기
		rdto.setLicense1(license1);
		rdto.setLicense2(license2);
		rdto.setLicense3(license3);
		String licenseStr = "";
		for (int i = 0; i < license1.size(); i++) {
			licenseStr += license1.get(i) + "`";
			licenseStr += license2.get(i) + "`";
			licenseStr += license3.get(i) + "|";
		}
		licenseStr.substring(0, licenseStr.length() - 1);
		rdto.setLicense(licenseStr);
		
		//activity 세 항목 합쳐서 스트링 형태로 rdto에 넣기
		rdto.setActivity1(activity1);
		rdto.setActivity2(activity2);
		rdto.setActivity3(activity3);
		String activityStr = "";
		for (int i = 0; i < activity1.size(); i++) {
			activityStr += activity1.get(i) + "`";
			activityStr += activity2.get(i) + "`";
			activityStr += activity3.get(i) + "|";
		}
		activityStr.substring(0, activityStr.length() - 1);
		rdto.setActivity(activityStr);
		
		//career 다섯 항목 합쳐서 스트링 형태로 rdto에 넣기
		rdto.setCareer1(career1);
		rdto.setCareer2(career2);
		rdto.setCareer3(career3);
		rdto.setCareer3(career4);
		rdto.setCareer3(career5);
		String careerStr = "";
		for (int i = 0; i < career1.size(); i++) {
			careerStr += career1.get(i) + "`";
			careerStr += career2.get(i) + "`";
			careerStr += career3.get(i) + "`";
			careerStr += career4.get(i) + "`";
			careerStr += career5.get(i) + "|";
		}
		careerStr.substring(0, careerStr.length() - 1);
		rdto.setCareer(careerStr);
		
		//update
		mymapper.updateMypageResume(rdto);

		return "redirect:main"; 
	}
	
	// 공고 수정 폼으로 가기
	@GetMapping("/mypage/notice_update_form")
	public ModelAndView updatenoticeform(HttpSession session,
			@RequestParam String notice_num) {

		String myid = (String) session.getAttribute("myid");
		NoticesDto ndto = nomapper.getNoticeInfo(notice_num);

		//지원자격 항목 나누어서 리스트에 담기
		List<String> qual = new ArrayList<String>();
		String[] qList = ndto.getQualification().split(" - ");
		for (int i = 0; i < qList.length; i++) {
			qual.add(qList[i]);
		}
		
		//우대사항 항목 나누어서 리스트에 담기
		List<String> pref = new ArrayList<String>();
		String[] pList = ndto.getPreference().split(" - ");
		for (int i = 0; i < pList.length; i++) {
			pref.add(pList[i]);
		}
		
		//업무내용 항목 나누어서 리스트에 담기
		List<String> task = new ArrayList<String>();
		String[] tList = ndto.getTask().split(" - ");
		for (int i = 0; i < tList.length; i++) {
			task.add(tList[i]);
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("qual", qual);
		mv.addObject("pref", pref);
		mv.addObject("task", task);
		mv.addObject("noticedto", ndto);
		mv.setViewName("/mypage/mynoticeupdate");
		return mv;
	}
	
	// 공고 수정
	@PostMapping("/mypage/notice_update")
	public String notice_update(@ModelAttribute NoticesDto ndto,
			@RequestParam List<String> qualification,
			@RequestParam List<String> preference,
			@RequestParam List<String> task,
			@RequestParam String num,
			HttpSession session) {
		
		String loginok = (String) session.getAttribute("loginok");
		String myid = (String) session.getAttribute("myid");
		
		System.out.println("[notice_update] id:"+myid+", loginok:"+loginok);

		// qualification 합쳐서 스트링 형태로 ndto에 넣기
		String qualificationStr = "";
		for (int i = 0; i < qualification.size(); i++) {
			qualificationStr += qualification.get(i) + " - ";
		}
		qualificationStr = qualificationStr.substring(0, qualificationStr.length() - 3);
		ndto.setQualification(qualificationStr);
		
		// preference 합쳐서 스트링 형태로 ndto에 넣기
		String preferenceStr = "";
		for (int i = 0; i < preference.size(); i++) {
			preferenceStr += preference.get(i) + " - ";
		}
		preferenceStr=preferenceStr.substring(0, preferenceStr.length() - 3);
		ndto.setPreference(preferenceStr);
		
		// task 합쳐서 스트링 형태로 ndto에 넣기
		String taskStr = "";
		for (int i = 0; i < task.size(); i++) {
			taskStr += task.get(i) + " - ";
		}
		taskStr=taskStr.substring(0, taskStr.length() - 3);
		ndto.setTask(taskStr);		
		
		ndto.setCompany_id(myid);
		ndto.setNum(num);
		
		//update
		mymapper.updateMypageNotice(ndto);

		return "redirect:/notices/detail?num="+ndto.getNum(); 
	}
	
	//개인 - 지원 관리
	@GetMapping("/mypage/applications")
	public String applications() {
		
		return "/mypage/notice_applied_list";
	}
	
	//개인 - 스크랩 공고
	@GetMapping("/mypage/scraps")
	public String scraps() {
		
		return "/mypage/notice_scrapped_list";
	}
	
	//기업- 지원자 현황 가기
	@GetMapping("/mypage/applicants")
	public ModelAndView applicants(HttpSession session) {
		String company_id = (String) session.getAttribute("myid");
		List<NoticesDto> ndtoList = mymapper.getNoticesInfo(company_id);
		int applicantsCount = mymapper.getTotalNoticesApplicantsCount(company_id);
		
//		List<UserDto> ndtoList = loginmapper.getUserData(company_id)
		List<String> applicantsByCompany = mymapper.getApplicantsByCompany(company_id);
		
		ModelAndView mv = new ModelAndView();		
		mv.addObject("noticesdtolist",ndtoList);
		mv.addObject("applicantsCount",applicantsCount);
		mv.addObject("applicantsByCompany",applicantsByCompany);
		mv.setViewName("/mypage/applicantslist");
		
		return mv;
	}
	
	@GetMapping("/mypage/updatpassform")
	public String updateuser() {
		
		return "/mypage/updatepassform";
	}
	
	
}
