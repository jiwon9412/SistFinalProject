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
}
