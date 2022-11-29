package kr.ac.cropfit.model;

import java.util.Date;

public class Purchase {

	int purchase_NO;
	String USER_ID;
	int trade_NO;
	String purchase_KG;
	String purchase_RQ;
	Date purchase_RQ_DATE;
	
	public int getPurchase_NO() {
		return purchase_NO;
	}
	public void setPurchase_NO(int purchase_NO) {
		this.purchase_NO = purchase_NO;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public int getTrade_NO() {
		return trade_NO;
	}
	public void setTrade_NO(int trade_NO) {
		this.trade_NO = trade_NO;
	}
	public String getPurchase_KG() {
		return purchase_KG;
	}
	public void setPurchase_KG(String purchase_KG) {
		this.purchase_KG = purchase_KG;
	}
	public String getPurchase_RQ() {
		return purchase_RQ;
	}
	public void setPurchase_RQ(String purchase_RQ) {
		this.purchase_RQ = purchase_RQ;
	}
	public Date getPurchase_RQ_DATE() {
		return purchase_RQ_DATE;
	}
	public void setPurchase_RQ_DATE(Date purchase_RQ_DATE) {
		this.purchase_RQ_DATE = purchase_RQ_DATE;
	}
	
	
	
}
