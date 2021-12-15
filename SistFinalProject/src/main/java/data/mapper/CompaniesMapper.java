package data.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.CompaniesDto;

@Mapper
public interface CompaniesMapper {

	public int getTotalCount();
	
	public List<CompaniesDto> getList();
}
