package data.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import data.dto.CompaniesDto;
import data.dto.MypageResumeDto;
import data.dto.OfferDto;
import data.dto.UserDto;

@Mapper
public interface PositionMapper {

	//받은 포지션 제안 숫자
	public int getTotalOffers(String myid);
	
	//id값에 따른 포지션별 전체출력 & 페이징 처리
	public List<OfferDto> getAllOffers(String myid);
	
	//랜덤으로 출력
	public List<CompaniesDto> getRndList();
	
	//오퍼 삭제
	public void deleteOffer(String company_id);
	
	//모달 출력을 위한 데이터
	public OfferDto getOffer(HashMap<String, String> map);
	
	//모든 이력서 데이터
	public List<UserDto> getAllResume(String id);
	
	//num에 따른 이력서 데이터
	public MypageResumeDto getResume(String num);
	
	//포지션 제안하기 DB에 입력
	public void insertOffer(OfferDto oDto);
}
