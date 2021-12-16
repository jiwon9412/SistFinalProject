package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("comdto")
public class CompaniesDto {

	private String id;
	private String pass;
	private String name;
	private String logo;
	private String addr;
	private String ceo;
	private String employees;
	private String birth1;
	private String birth2;
	private String birth3;
	private String establishment;
	private String sales;
	private String major;
	private String insurance;
	private String site;
	private String photo;
	private String intro;
	private String hp;
	private String hp1;
	private String hp2;
	private String hp3;
	
	
}
