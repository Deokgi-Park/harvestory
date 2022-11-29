package kr.ac.cropfit.model;

import java.util.Date;

public class Board {
	
	int board_NO;
	String user_ID;
	String board_TITLE;
	String board_CONTENT;
	String board_STATUS;
	Date board_DATE;
	String user_NAME;
	String answer_CONTENT;
	
	public String getAnswer_CONTENT() {
		return answer_CONTENT;
	}
	public void setAnswer_CONTENT(String answer_CONTENT) {
		this.answer_CONTENT = answer_CONTENT;
	}
	public String getUser_NAME() {
		return user_NAME;
	}
	public void setUser_NAME(String user_NAME) {
		this.user_NAME = user_NAME;
	}
	public int getBoard_NO() {
		return board_NO;
	}
	public void setBoard_NO(int board_NO) {
		this.board_NO = board_NO;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public String getBoard_TITLE() {
		return board_TITLE;
	}
	public void setBoard_TITLE(String board_TITLE) {
		this.board_TITLE = board_TITLE;
	}
	public String getBoard_CONTENT() {
		return board_CONTENT;
	}
	public void setBoard_CONTENT(String board_CONTENT) {
		this.board_CONTENT = board_CONTENT;
	}
	public String getBoard_STATUS() {
		return board_STATUS;
	}
	public void setBoard_STATUS(String board_STATUS) {
		this.board_STATUS = board_STATUS;
	}
	public Date getBoard_DATE() {
		return board_DATE;
	}
	public void setBoard_DATE(Date board_DATE) {
		this.board_DATE = board_DATE;
	}
	
	
	
}
