package data.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.CompaniesDto;

@Mapper
public interface CompaniesMapper {

	public int getTotalCount();
	
	public List<CompaniesDto> getList();
	
	//채용공고에서 photo가져오기
	public String getPhoto(String id);
}
