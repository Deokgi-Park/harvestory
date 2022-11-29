package kr.ac.cropfit.model;

import java.util.Date;

public class Message {
	
	int msg_NO;
	String msg_WITH;
	String msg_CONTENT;
	Date msg_SENT_DT;
	String msg_DELETE;
	String msg_ANSWER;
	String msg_CHECK;
	String user_ID;
	String msg_WITH_NAME;
	String user_NAME;
	
	
	public String getUser_NAME() {
		return user_NAME;
	}
	public void setUser_NAME(String user_NAME) {
		this.user_NAME = user_NAME;
	}
	public String getMsg_WITH_NAME() {
		return msg_WITH_NAME;
	}
	public void setMsg_WITH_NAME(String msg_WITH_NAME) {
		this.msg_WITH_NAME = msg_WITH_NAME;
	}
	public int getMsg_NO() {
		return msg_NO;
	}
	public void setMsg_NO(int msg_NO) {
		this.msg_NO = msg_NO;
	}
	public String getMsg_WITH() {
		return msg_WITH;
	}
	public void setMsg_WITH(String msg_WITH) {
		this.msg_WITH = msg_WITH;
	}
	public String getMsg_CONTENT() {
		return msg_CONTENT;
	}
	public void setMsg_CONTENT(String msg_CONTENT) {
		this.msg_CONTENT = msg_CONTENT;
	}
	public Date getMsg_SENT_DT() {
		return msg_SENT_DT;
	}
	public void setMsg_SENT_DT(Date msg_SENT_DT) {
		this.msg_SENT_DT = msg_SENT_DT;
	}
	public String getMsg_DELETE() {
		return msg_DELETE;
	}
	public void setMsg_DELETE(String msg_DELETE) {
		this.msg_DELETE = msg_DELETE;
	}
	public String getMsg_ANSWER() {
		return msg_ANSWER;
	}
	public void setMsg_ANSWER(String msg_ANSWER) {
		this.msg_ANSWER = msg_ANSWER;
	}
	public String getMsg_CHECK() {
		return msg_CHECK;
	}
	public void setMsg_CHECK(String msg_CHECK) {
		this.msg_CHECK = msg_CHECK;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	
	
	
}
