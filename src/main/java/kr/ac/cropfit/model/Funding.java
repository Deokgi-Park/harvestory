package kr.ac.cropfit.model;

import java.util.Date;

public class Funding {

	int purchase_NO;
	String user_ID;
	int trade_NO;
	String funding_FIELD;
	String funding_RQ;
	String product_RECEIPT;
	Date funding_RQ_DATE;
	
	
	public int getPurchase_NO() {
		return purchase_NO;
	}
	public void setPurchase_NO(int purchase_NO) {
		this.purchase_NO = purchase_NO;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public int getTrade_NO() {
		return trade_NO;
	}
	public void setTrade_NO(int trade_NO) {
		this.trade_NO = trade_NO;
	}
	public String getFunding_FIELD() {
		return funding_FIELD;
	}
	public void setFunding_FIELD(String funding_FIELD) {
		this.funding_FIELD = funding_FIELD;
	}
	public String getFunding_RQ() {
		return funding_RQ;
	}
	public void setFunding_RQ(String funding_RQ) {
		this.funding_RQ = funding_RQ;
	}
	public String getProduct_RECEIPT() {
		return product_RECEIPT;
	}
	public void setProduct_RECEIPT(String product_RECEIPT) {
		this.product_RECEIPT = product_RECEIPT;
	}
	public Date getFunding_RQ_DATE() {
		return funding_RQ_DATE;
	}
	public void setFunding_RQ_DATE(Date funding_RQ_DATE) {
		this.funding_RQ_DATE = funding_RQ_DATE;
	}
	
	
	
	
}
