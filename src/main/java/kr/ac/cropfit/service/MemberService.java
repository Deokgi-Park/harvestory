package kr.ac.cropfit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.ac.cropfit.model.Image;
import kr.ac.cropfit.model.Member;

public interface MemberService {

	int signUp(Member signUpMember);

	int idDupCheck(String user_ID);

	Member login(Member loginRequest);

	void mailSendWithUserKey(String user_EMAIL, String user_NAME, HttpServletRequest request);

	int alter_userKey_service(Member alterConfirmInfo);

	int InfoChangeRequest(Member infoChangeRequest);

	Member InfoChangedMember(Member infoChangeRequest);

	void userProfileChange(List<Image> files);

	int myPasswordChng(String user_ID, String user_CURR_PW, String user_PW);
	
	

}
