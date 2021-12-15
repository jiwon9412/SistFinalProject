package data.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import data.dto.NoticesDto;

@Mapper
public interface NoticesMapper {
	
	public ArrayList<NoticesDto> getAllNotices();

}
