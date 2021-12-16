package data.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import data.dto.NoticesDto;

@Mapper
public interface NoticesMapper {
	
	public ArrayList<NoticesDto> getAllNotices();
	public ArrayList<NoticesDto> getList(int start, int perpage);
	public int getTotalCount();
	
	public void insertScrap(String user_id,String notice_num);
	public void deleteScrap(String user_id,String notice_num);
	public int checkScrap(String user_id,String notice_num);
}
