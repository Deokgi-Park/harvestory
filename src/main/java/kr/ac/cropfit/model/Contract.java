package kr.ac.cropfit.model;

import java.util.Date;

public class Contract {

	int contract_NO;
	String user_ID;
	int funding_NO;
	int auction_NO;
	int img_NO;
	Date contract_DATE;
	String contract_ARTICLE;
	String contract_STATUS;
	
	public int getContract_NO() {
		return contract_NO;
	}
	public void setContract_NO(int contract_NO) {
		this.contract_NO = contract_NO;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public int getFunding_NO() {
		return funding_NO;
	}
	public void setFunding_NO(int funding_NO) {
		this.funding_NO = funding_NO;
	}
	public int getAuction_NO() {
		return auction_NO;
	}
	public void setAuction_NO(int auction_NO) {
		this.auction_NO = auction_NO;
	}
	public int getImg_NO() {
		return img_NO;
	}
	public void setImg_NO(int img_NO) {
		this.img_NO = img_NO;
	}
	public Date getContract_DATE() {
		return contract_DATE;
	}
	public void setContract_DATE(Date contract_DATE) {
		this.contract_DATE = contract_DATE;
	}
	public String getContract_ARTICLE() {
		return contract_ARTICLE;
	}
	public void setContract_ARTICLE(String contract_ARTICLE) {
		this.contract_ARTICLE = contract_ARTICLE;
	}
	public String getContract_STATUS() {
		return contract_STATUS;
	}
	public void setContract_STATUS(String contract_STATUS) {
		this.contract_STATUS = contract_STATUS;
	}
	
	
	
	
	
	
}
