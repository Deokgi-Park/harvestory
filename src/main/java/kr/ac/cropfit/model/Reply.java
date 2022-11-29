package kr.ac.cropfit.model;

import java.util.Date;

public class Reply {

	int reply_NO;
	int board_NO;
	String reply_CONTENT;
	Date reply_DATE;
	String reply_STATUS;
	String reply_WRITER;
	
	String user_NAME;
	
	public int getReply_NO() {
		return reply_NO;
	}
	public void setReply_NO(int reply_NO) {
		this.reply_NO = reply_NO;
	}
	public int getBoard_NO() {
		return board_NO;
	}
	public void setBoard_NO(int board_NO) {
		this.board_NO = board_NO;
	}
	public String getReply_CONTENT() {
		return reply_CONTENT;
	}
	public void setReply_CONTENT(String reply_CONTENT) {
		this.reply_CONTENT = reply_CONTENT;
	}
	public Date getReply_DATE() {
		return reply_DATE;
	}
	public void setReply_DATE(Date reply_DATE) {
		this.reply_DATE = reply_DATE;
	}
	public String getReply_STATUS() {
		return reply_STATUS;
	}
	public void setReply_STATUS(String reply_STATUS) {
		this.reply_STATUS = reply_STATUS;
	}
	public String getReply_WRITER() {
		return reply_WRITER;
	}
	public void setReply_WRITER(String reply_WRITER) {
		this.reply_WRITER = reply_WRITER;
	}
	public String getUser_NAME() {
		return user_NAME;
	}
	public void setUser_NAME(String user_NAME) {
		this.user_NAME = user_NAME;
	}
	
	
	
	
	
}
