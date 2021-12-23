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
	
	//notice main page에 필요한 모든 정보 담는 dto얻기
	public ArrayList<NoticesDto> getListInfo(int start, int perpage);
	
	//notice type page에 필요한 모든 정보 담는 dto얻기
	public ArrayList<NoticesDto> getTypeInfo(String type,int start, int perpage);
	
	//채용중인 공고리스트(마감날짜 지나지않은 공고)
	public ArrayList<NoticesDto> getHireList(String today);
	
	//검색어에 알맞는 공고리스트
	public ArrayList<NoticesDto> getSearchList(String search);
	public int getSearchCount(String search);
	
	//채용중인 공고리스트 수
	public int getHireCnt(String today);
	
	
	//지원하기
	public void insertApplication(String user_id, String company_id, String notice_num);
	//이미 지원했는지 확인
	public int checkApplication(String user_id, String company_id, String notice_num);
	//지원자수 업데이트
	public void updateAppCnt(String notice_num);
	
	//application table
	//해당 공고 지원자 총수
	public int getTotalAppCount(String notice_num);
	public int getManAppCount(String notice_num);
	public int getWomanAppCount(String notice_num);
	
	//메인 페이지
	//마감 임박 순 리스트
	public ArrayList<NoticesDto> getDeadlineList(String today);
	//지원자 순 리스트
	public ArrayList<NoticesDto> getAppCntList(String today);
	
	
	
}
