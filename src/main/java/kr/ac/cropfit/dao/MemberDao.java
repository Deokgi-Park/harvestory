package kr.ac.cropfit.dao;

import java.util.List;

import kr.ac.cropfit.model.Image;
import kr.ac.cropfit.model.Member;

public interface MemberDao {

	int signUp(Member signUpMember);

	int idDupCheck(String user_ID);

	String loginPWCheck(String user_ID);

	Member login(Member loginRequest);

	
	
	void userKeySetting(Member userKeySetting);

	int alter_userKey_service(Member alterConfirmInfo);

	void signUpBasicProfileImg(String user_ID);

	int InfoChangeRequest(Member infoChangeRequest);

	Member InfoChangedMember(Member infoChangeRequest);

	void userProfileChange(List<Image> files);

	int myPasswordChng(Member pwChngMember);
	
	

}
