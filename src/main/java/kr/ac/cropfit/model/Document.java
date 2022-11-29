package kr.ac.cropfit.model;

import java.util.Date;

public class Document {

	int doc_NO;
	String doc_PATH;
	String doc_PERMIT;
	String doc_CHNG_NM;
	String doc_ORGN_NM;
	Date doc_CREATE_DT;
	String doc_STATUS;
	String user_ID;
	
	
	public int getDoc_NO() {
		return doc_NO;
	}
	public void setDoc_NO(int doc_NO) {
		this.doc_NO = doc_NO;
	}
	public String getDoc_PATH() {
		return doc_PATH;
	}
	public void setDoc_PATH(String doc_PATH) {
		this.doc_PATH = doc_PATH;
	}
	public String getDoc_PERMIT() {
		return doc_PERMIT;
	}
	public void setDoc_PERMIT(String doc_PERMIT) {
		this.doc_PERMIT = doc_PERMIT;
	}
	public String getDoc_CHNG_NM() {
		return doc_CHNG_NM;
	}
	public void setDoc_CHNG_NM(String doc_CHNG_NM) {
		this.doc_CHNG_NM = doc_CHNG_NM;
	}
	public String getDoc_ORGN_NM() {
		return doc_ORGN_NM;
	}
	public void setDoc_ORGN_NM(String doc_ORGN_NM) {
		this.doc_ORGN_NM = doc_ORGN_NM;
	}
	public Date getDoc_CREATE_DT() {
		return doc_CREATE_DT;
	}
	public void setDoc_CREATE_DT(Date doc_CREATE_DT) {
		this.doc_CREATE_DT = doc_CREATE_DT;
	}
	public String getDoc_STATUS() {
		return doc_STATUS;
	}
	public void setDoc_STATUS(String doc_STATUS) {
		this.doc_STATUS = doc_STATUS;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	
	
	
}
