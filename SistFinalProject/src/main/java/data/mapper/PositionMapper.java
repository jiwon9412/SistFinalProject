package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.OfferDto;

@Mapper
public interface PositionMapper {

	//받은 포지션 제안 숫자
	public int getTotalOffers(String myid);
	
	//id값에 따른 포지션별 전체출력 & 페이징 처리
	public List<OfferDto> getAllOffers(String myid);
}
