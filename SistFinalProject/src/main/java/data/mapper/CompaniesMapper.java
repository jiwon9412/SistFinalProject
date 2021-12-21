package data.mapper;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import data.dto.CompaniesDto;
import data.dto.NoticesDto;

@Mapper
public interface CompaniesMapper {

	public int getTotalCount();
	
	public ArrayList<CompaniesDto> getList(int start,int perpage);
	
	//채용공고에서 photo가져오기
	public String getPhoto(String id);
	
	//단일 데이터조회
	public CompaniesDto getData(String id);
	
	//major별 출력
	public ArrayList<CompaniesDto> getIndustryList(String industry,int start,int perpage);
	public int getIndustryCount(String industry);
	
	//채용중 리스트 출력
	public ArrayList<CompaniesDto> getHireList(String today);
	
	//해당 기업의 채용중인 리스트 출력 (기업상세페이지)
	public ArrayList<NoticesDto> getOneHireList(String today,String id);
	
	//notice 단일 데이터조회
	public NoticesDto getOneNotice(String num);
}
