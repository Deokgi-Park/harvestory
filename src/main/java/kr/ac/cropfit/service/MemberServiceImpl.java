package kr.ac.cropfit.service;

import java.util.List;
import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.ac.cropfit.dao.MemberDao;
import kr.ac.cropfit.model.Image;
import kr.ac.cropfit.model.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public int idDupCheck(String user_ID) {
		return memberDao.idDupCheck(user_ID);
	}

	@Override
	public int signUp(Member signUpMember) {
		String encPwd = bCryptPasswordEncoder.encode(signUpMember.getUser_PW());
		signUpMember.setUser_PW(encPwd);

		int signUpResult = memberDao.signUp(signUpMember);

		if(signUpResult > 0)
			memberDao.signUpBasicProfileImg(signUpMember.getUser_EMAIL());
		
		return signUpResult;

	}

	// 이메일 난수 만드는 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	// 회원가입 발송 이메일(인증키 발송)
	public void mailSendWithUserKey(String user_ID, String user_NAME, HttpServletRequest request) {

		String key = getKey(false, 20);

		Member userKeySetting = new Member();
		userKeySetting.setUser_ID(user_ID);
		userKeySetting.setKey(key);
		System.out.println("발생 된 User Key : " + key);

		memberDao.userKeySetting(userKeySetting);
		System.out.println("세팅 된 User Key : " + userKeySetting.getKey());

		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요, Harvestory에 가입해주셔서 감사합니다.</h2><br><br>" + "<h3>" + user_NAME + "님,</h3>"
				+ "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " + "<a href='http://localhost:8010/cropfit/key_alter?user_ID=" + user_ID + "&key=" + key + "'>인증하기</a></p>"
				+ "(회원가입을 하신 적이 없는 경우 무시하셔도 됩니다.)";
		try {
			mail.setSubject("[본인인증] Harvestory 인증메일입니다.", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(user_ID));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}

	@Override
	public int alter_userKey_service(Member alterConfirmInfo) {

		int alterConfirmResult = memberDao.alter_userKey_service(alterConfirmInfo);

		if (alterConfirmResult == 0)
			System.out.println("ServiceImpl - 이메일 인증 실패");

		return alterConfirmResult;
	}

	@Override
	public Member login(Member loginRequest) {

		String RequestResult = memberDao.loginPWCheck(loginRequest.getUser_ID());

		Member loginMember = null;
	
		if(RequestResult == null)
			return loginMember;
		
		if (!bCryptPasswordEncoder.matches(loginRequest.getUser_PW(), RequestResult)) {
			RequestResult = null;
			System.out.println("비밀번호 불일치");
		} else {
			System.out.println("비밀번호 일치");
		}

		if (RequestResult != null) {
			loginRequest.setUser_PW(RequestResult);
			loginMember = memberDao.login(loginRequest);
		}

		return loginMember;

	}

	@Override
	public int InfoChangeRequest(Member infoChangeRequest) {
		
		int infoChngRq = memberDao.InfoChangeRequest(infoChangeRequest);
		
		return infoChngRq;
	}

	@Override
	public Member InfoChangedMember(Member infoChangeRequest) {
		return memberDao.InfoChangedMember(infoChangeRequest);
	}

	@Override
	public void userProfileChange(List<Image> files) {
		memberDao.userProfileChange(files);
	}

	@Override
	public int myPasswordChng(String user_ID, String user_CURR_PW, String user_PW) {
		
		String RequestResult = memberDao.loginPWCheck(user_ID);
		int pwChngRq = 0;
		
		if (!bCryptPasswordEncoder.matches(user_CURR_PW, RequestResult)) {
			pwChngRq = 0;
			System.out.println("비밀번호 불일치");
		} else {
			Member pwChngMember = new Member();
			
			pwChngMember.setUser_ID(user_ID);
			
			String encPwd = bCryptPasswordEncoder.encode(user_PW);
			pwChngMember.setUser_PW(encPwd);		
			
			pwChngRq = memberDao.myPasswordChng(pwChngMember);
		}
		
		return pwChngRq;
	}

}
