package data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import data.dto.MypageResumeDto;
import data.dto.NoticesDto;

@Mapper
public interface MypageMapper {
	
	//개인로그인 - 마이페이지
	public void insertMypageResume(MypageResumeDto rdto);
	public MypageResumeDto getMypageResume(String user_id);
	public void updateMypageResume(MypageResumeDto rdto);
	public int checkResume(String user_id);
	
	//기업로그인 - 마이페이지
	public void insertMypageNotice(NoticesDto ndto);
	public int getNoticeCountByCompany(String company_id);
	public void updateMypageNotice(NoticesDto ndto);
	public List<NoticesDto> getNoticesInfo(String company_id); //지원자 현황 리스트 출력
	public int getTotalNoticesApplicantsCount(String company_id); //동회사 모든 공고의 지원자 수 합계
	public List<Map<String, String>> getApplicantsByCompany(String company_id); //회사별 지원자 아이디와 공고num 얻기

}
