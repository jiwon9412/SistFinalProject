package data.mapper;

import org.apache.ibatis.annotations.Mapper;

import data.dto.MypageResumeDto;
import data.dto.NoticesDto;

@Mapper
public interface MypageMapper {
	
	public void insertMypageResume(MypageResumeDto rdto);
	public MypageResumeDto getMypageResume(String user_id);
	public void updateMypageResume(MypageResumeDto rdto);
	public int checkResume(String user_id);
	
	public void insertMypageNotice(NoticesDto ndto);
	public void updateMypageNotice(NoticesDto ndto);

}
