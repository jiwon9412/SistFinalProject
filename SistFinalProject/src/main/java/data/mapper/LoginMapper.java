package data.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {
	
	public int login(HashMap<String, String> map);
	public String getName(String id);

}
