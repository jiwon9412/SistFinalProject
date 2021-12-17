package data.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import data.dto.CompaniesDto;
import data.dto.UserDto;

@Mapper
public interface LoginMapper {
	
	public int login(HashMap<String, String> map);
	public String getName(String id);
	public void insertUser(UserDto dto);
	public int getIdCheck(String id);
	public String getUserData(String id);
	
	public int corplogin(HashMap<String, String>map);
	public String getCorpName(String id);
	public void insertCorp(CompaniesDto comdto);
	public int getCorpIdCheck(String id);
	public String getCorpData(String id);

}
