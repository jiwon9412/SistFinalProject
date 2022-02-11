package data.service;

import data.controller.KaKaoService;
import data.dto.CompaniesDto;
import data.dto.LoginChkDto;
import data.dto.UserDto;
import data.mapper.LoginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.HashMap;

@Service
public class LoginService {

    @Autowired
    private LoginMapper loginMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private KaKaoService kakaoService;

    private String CLIENT_ID = "lAKSwHKCFttsryyK8HWl"; //애플리케이션 클라이언트 아이디값";
    private String CLI_SECRET = "LsHuqKXvaP"; //애플리케이션 클라이언트 시크릿값";

    public String getLoginForm(HttpSession session, Model model) throws UnsupportedEncodingException {

        //아이디
        String myid = (String)session.getAttribute("myid");

        //로그인 확인
        String loginok = (String)session.getAttribute("loginok");

        //로그인 타입
        String logintype = (String)session.getAttribute("logintype");

        //콜백 주소
        String redirectURI = URLEncoder.encode("http://localhost:9003/login/callback1", "UTF-8");
        SecureRandom random = new SecureRandom();
        String state = new BigInteger(130, random).toString();
        String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"; //api 주소
        apiURL += String.format("&client_id=%s&redirect_uri=%s&state=%s",
                CLIENT_ID, redirectURI, state);
        session.setAttribute("state", state);
        model.addAttribute("apiURL", apiURL);

        return loginok;
    }

    public int LoginProcess(LoginChkDto dto, HttpSession session) {

        HashMap<String, String> map = new HashMap<String, String>();
        map.put("id", dto.getId());
        map.put("pass", dto.getPass());

        int check = 0;
        String nick = "";
        boolean loginChk = false;

        if(dto.getLogintype().equals("개인회원")) {
            check = loginMapper.login(map);
            UserDto udto = loginMapper.getUserLogin(dto.getId());
            loginChk = passwordEncoder.matches(dto.getPass(), udto.getPass()); // 패스워드 매칭(입력한 값, 저장된 값)
            nick = loginMapper.getName(dto.getId());
        } else if(dto.getLogintype().equals("기업회원")){
            check = loginMapper.corplogin(map);
            CompaniesDto cdto = loginMapper.getCorpLogin(dto.getId());
            loginChk = passwordEncoder.matches(dto.getPass(), cdto.getPass());
            nick = loginMapper.getCorpName(dto.getId());
        }

        //if(check==1) {
        if(loginChk == true || check == 1) {
            session.setAttribute("myid", dto.getId());
            session.setAttribute("loginok", "yes");
            session.setAttribute("nick", nick);
            if(dto.getLogintype().equals("개인회원")) {
                session.setAttribute("logintype", "user");
            } else if (dto.getLogintype().equals("기업회원")){
                session.setAttribute("logintype", "corp");
            }
        }

        return check;
    }

    public ModelAndView addUser(UserDto dto, HttpSession session) {

        //날짜 형식으로 넣어주기
        String Birth = dto.getBirth1() + "-" + dto.getBirth2() + "-" + dto.getBirth3();
        dto.setBirth(Birth);

        //이메일 형식으로 넣어주기
        String email = dto.getEmail1() + "@" + dto.getEmail2();
        dto.setEmail(email);

        //연락처 형식으로 넣어주기
        String hp = dto.getHp1() + "-" + dto.getHp2() + "-" + dto.getHp3();
        dto.setHp(hp);

        //패스워드 암호화
        dto.setPass(passwordEncoder.encode(dto.getPass()));

        loginMapper.insertUser(dto);

        session.setAttribute("signupType", "user");

        ModelAndView mview = new ModelAndView();

        mview.addObject("name", dto.getName());
        mview.addObject("id", dto.getId());
        mview.setViewName("/login/addsuccess");

        return mview;
    }

    public ModelAndView addCorp(CompaniesDto dto, HttpSession session){

        ModelAndView mview = new ModelAndView();

        String path = session.getServletContext().getRealPath("/images");

        String photo = "";
        String logo = dto.getLogoimage().getOriginalFilename();

        try {
            dto.getLogoimage().transferTo(new File(path + "\\" + logo));
        } catch (IllegalStateException | IOException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        if(dto.getPhotoimage().get(0).getOriginalFilename().equals(""))
            photo = "no";
        else {
            for(MultipartFile f:dto.getPhotoimage()) {
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

        //비밀번호 암호화
        dto.setPass(passwordEncoder.encode(dto.getPass()));

        loginMapper.insertCorp(dto);

        session.setAttribute("signupType", "corp");

        mview.addObject("name", dto.getName());
        mview.addObject("id", dto.getId());
        mview.setViewName("/login/addsuccess");

        return mview;
    }

}
