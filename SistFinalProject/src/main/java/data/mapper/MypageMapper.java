package data.mapper;

import org.apache.ibatis.annotations.Mapper;

import data.dto.MypageResumeDto;

@Mapper
public interface MypageMapper {
	
	public void insertMypageResume(MypageResumeDto user_id);
	public MypageResumeDto getMypageResume(String user_id);
	public void updateMypageResume(MypageResumeDto user_id);
	public int checkResume(String user_id);

}
