package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ndto")
public class NoticesDto {
	
	private String num;
	private String company_id;
	private String section;
	private String task;
	private String type;
	private String personnel;
	private String qualification;
	private String preference;
	private String location;
	private String period_start;
	private String period_end;
	private String subject;
	//table엔 없는데 편의를 위해 추가
	private String photo;
	private int check;
	private String logo;
	private String name;
	private String addr;
	private String site;
	private String intro;
}
