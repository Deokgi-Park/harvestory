package kr.ac.cropfit.model;

import java.util.Date;

public class Member {
	
	String user_ID;
	String user_GRADE;
	String user_PW;
	int user_PHONE;
	String user_NAME;
	String user_ADDRESS;
	String user_EMAIL;
	String user_ACCOUNT;
	String user_STATUS;
	int user_REPORT;
	Date user_ENROLLDATE;
	String user_ENROLL_KIND; 
	
	
	String key; // 이메일 인증용
	
	// 프로필사진 View ( 세션용 ) 
	
	String img_KIND;
	String img_PATH;
	String img_CHNG_NM;
	String img_STATUS;
		
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getUser_ENROLL_KIND() {
		return user_ENROLL_KIND;
	}
	public void setUser_ENROLL_KIND(String user_ENROLL_KIND) {
		this.user_ENROLL_KIND = user_ENROLL_KIND;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public String getUser_GRADE() {
		return user_GRADE;
	}
	public void setUser_GRADE(String user_GRADE) {
		this.user_GRADE = user_GRADE;
	}
	public String getUser_PW() {
		return user_PW;
	}
	public void setUser_PW(String user_PW) {
		this.user_PW = user_PW;
	}
	public int getUser_PHONE() {
		return user_PHONE;
	}
	public void setUser_PHONE(int user_PHONE) {
		this.user_PHONE = user_PHONE;
	}
	public String getUser_NAME() {
		return user_NAME;
	}
	public void setUser_NAME(String user_NAME) {
		this.user_NAME = user_NAME;
	}
	public String getUser_ADDRESS() {
		return user_ADDRESS;
	}
	public void setUser_ADDRESS(String user_ADDRESS) {
		this.user_ADDRESS = user_ADDRESS;
	}
	public String getUser_EMAIL() {
		return user_EMAIL;
	}
	public void setUser_EMAIL(String user_EMAIL) {
		this.user_EMAIL = user_EMAIL;
	}
	public String getUser_ACCOUNT() {
		return user_ACCOUNT;
	}
	public void setUser_ACCOUNT(String user_ACCOUNT) {
		this.user_ACCOUNT = user_ACCOUNT;
	}
	public String getUser_STATUS() {
		return user_STATUS;
	}
	public void setUser_STATUS(String user_STATUS) {
		this.user_STATUS = user_STATUS;
	}
	public int getUser_REPORT() {
		return user_REPORT;
	}
	public void setUser_REPORT(int user_REPORT) {
		this.user_REPORT = user_REPORT;
	}
	public Date getUser_ENROLLDATE() {
		return user_ENROLLDATE;
	}
	public void setUser_ENROLLDATE(Date user_ENROLLDATE) {
		this.user_ENROLLDATE = user_ENROLLDATE;
	}
	
	
	
	
	
	// 프로필사진 View ( 세션용 ) 
	public String getImg_KIND() {
		return img_KIND;
	}
	public void setImg_KIND(String img_KIND) {
		this.img_KIND = img_KIND;
	}
	public String getImg_PATH() {
		return img_PATH;
	}
	public void setImg_PATH(String img_PATH) {
		this.img_PATH = img_PATH;
	}
	public String getImg_CHNG_NM() {
		return img_CHNG_NM;
	}
	public void setImg_CHNG_NM(String img_CHNG_NM) {
		this.img_CHNG_NM = img_CHNG_NM;
	}
	public String getImg_STATUS() {
		return img_STATUS;
	}
	public void setImg_STATUS(String img_STATUS) {
		this.img_STATUS = img_STATUS;
	}
	
	
	

	
	
	
	
}
