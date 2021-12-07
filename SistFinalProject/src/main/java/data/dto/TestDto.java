package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("tdto")
public class TestDto {
	
	private String num;
	private String name;

}
