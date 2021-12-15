package data.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import data.dto.UserDto;

@Mapper
public interface LoginMapper {
	
	public int login(HashMap<String, String> map);
	public String getName(String id);
	public void insertUser(UserDto dto);
	public int getIdCheck(String id);

}
