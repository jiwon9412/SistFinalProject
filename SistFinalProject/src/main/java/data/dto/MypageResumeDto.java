package data.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("resumedto")
public class MypageResumeDto {
	
	private String num;
	private String user_id;
	private String name;
	private String birth;
	private String photo;
	private String gender;
	private String email;
	private String hp;
	private String highschool,highschool1,highschool2,highschool3;
	private String college,college1,college2,college3;
	private String career,career1,career2,career3,career4,career5;
	private String activity,activity1,activity2,activity3;
	private String license,license1,license2,license3;
	private String portfolio;
	private MultipartFile uploadportfolio;
	private String military;
	private String introduce;
	private String job;

}
