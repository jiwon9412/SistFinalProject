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
	
	public ArrayList<NoticesDto> getTypeList(String type,int start, int perpage);
	public int getTypeCount(String type);
	public NoticesDto getNotice(String num);
	//notice detail page에 필요한 모든 정보 담는 dto얻기
	public NoticesDto getNoticeInfo(String num);
}
