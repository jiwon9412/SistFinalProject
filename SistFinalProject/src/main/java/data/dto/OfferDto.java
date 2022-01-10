package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("odto")
public class OfferDto {
	
	//기존 Offer Table
	private String user_id;
	private String company_id;
	private String notice_num;
	private String content;
	private String shortContent;

	
	//Companies Dto 끌어오기	private String id;
	private String name;
	private String major;
	private String id;
	private String logo;
	
	
	//MypageResume Dto 끌어오기
	private String noticen_num;
	private String job;
	private String career;
}
