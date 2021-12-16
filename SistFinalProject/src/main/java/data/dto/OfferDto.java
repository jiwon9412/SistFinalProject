package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("odto")
public class OfferDto {
	
	//기존 Offer Table
	private String user_id;
	private String company_id;
	private String content;

	
	//Companies Dto 끌어오기
	private String name;
	private String major;
}
