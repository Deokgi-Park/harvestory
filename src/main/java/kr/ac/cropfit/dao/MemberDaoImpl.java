package kr.ac.cropfit.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.cropfit.model.Image;
import kr.ac.cropfit.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public int signUp(Member signUpMember) {
		return sql.insert("member.signUp", signUpMember);
	}

	@Override
	public int idDupCheck(String user_ID) {
		return sql.selectOne("member.idDupCheck", user_ID);
	}

	@Override
	public String loginPWCheck(String user_ID) {
		return sql.selectOne("member.loginPWCheck", user_ID);
	}

	@Override
	public Member login(Member loginRequest) {
		return sql.selectOne("member.login", loginRequest);
	}

	@Override
	public void userKeySetting(Member userKeySetting) {
		sql.update("member.userKeySetting", userKeySetting);
	}

	@Override
	public int alter_userKey_service(Member alterConfirmInfo) {
		return sql.update("member.alter_userKey_service", alterConfirmInfo);
	}

	@Override
	public void signUpBasicProfileImg(String user_ID) {
		sql.insert("image.signUpBasicProfileImg", user_ID);
	}

	@Override
	public int InfoChangeRequest(Member infoChangeRequest) {
		return sql.update("member.infoChangeRequest",infoChangeRequest);
	}

	@Override
	public Member InfoChangedMember(Member infoChangeRequest) {
		return sql.selectOne("member.InfoChangedMember",infoChangeRequest);
	}

	@Override
	public void userProfileChange(List<Image> files) {
		sql.update("image.userProfileChange", files);
	}

	@Override
	public int myPasswordChng(Member pwChngMember) {
		return sql.update("member.myPasswordChng", pwChngMember);
	}	

	
}
