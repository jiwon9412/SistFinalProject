package data.mapper;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import data.dto.CompaniesDto;

@Mapper
public interface CompaniesMapper {

	public int getTotalCount();
	
	public ArrayList<CompaniesDto> getList(int start,int perpage);
	
	//채용공고에서 photo가져오기
	public String getPhoto(String id);
	
	//단일 데이터조회
	public CompaniesDto getData(String id);
	
	
}
