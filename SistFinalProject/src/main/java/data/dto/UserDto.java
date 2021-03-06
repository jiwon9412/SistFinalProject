package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("udto")
public class UserDto {
	
	private String id;
	private String pass;
	private String name;
	private String birth;
	private String birth1;
	private String birth2;
	private String birth3;
	private String email;
	private String email1;
	private String email2;
	private String hp;
	private String hp1;
	private String hp2;
	private String hp3;
	private String gender;
	private String addr;
	private String zipcode;
	private String addr_detail;
	
	//position/positionCorp
	private String num;
	private String job;
	private String career;
	private String introduce;
	
}
