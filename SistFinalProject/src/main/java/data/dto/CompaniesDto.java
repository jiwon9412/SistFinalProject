package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;

@Data
@Alias("comdto")
public class CompaniesDto {

	private String id;
	private String pass;
	private String name;
	private String logo;
	private String zipcode;
	private String addr;
	private String addr_detail;
	private String ceo;
	private String employees;
	private String birth1;
	private String birth2;
	private String birth3;
	private String establishment;
	private String sales;
	private String major;
	private String insurance;
	private String ins1;
	private String ins2;
	private String ins3;
	private String ins4;
	private String site;
	private String photo;
	private String intro;
	private String hp;
	private String hp1;
	private String hp2;
	private String hp3;
	private String industry;
	private MultipartFile logoimage;
	private ArrayList<MultipartFile> photoimage;
	
	
}
