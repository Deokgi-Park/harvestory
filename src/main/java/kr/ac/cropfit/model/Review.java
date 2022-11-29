package kr.ac.cropfit.model;

import java.util.Date;

public class Review {
	int review_NO;
	String user_ID;
	Date review_DATE;
	String review_CONTENT;
	int review_DELIVERY;
	int review_QUALITY;
	int trade_NO;
	public int getReview_NO() {
		return review_NO;
	}
	public void setReview_NO(int review_NO) {
		this.review_NO = review_NO;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public Date getReview_DATE() {
		return review_DATE;
	}
	public void setReview_DATE(Date review_DATE) {
		this.review_DATE = review_DATE;
	}
	public String getReview_CONTENT() {
		return review_CONTENT;
	}
	public void setReview_CONTENT(String review_CONTENT) {
		this.review_CONTENT = review_CONTENT;
	}
	public int getReview_DELIVERY() {
		return review_DELIVERY;
	}
	public void setReview_DELIVERY(int review_DELIVERY) {
		this.review_DELIVERY = review_DELIVERY;
	}
	public int getReview_QUALITY() {
		return review_QUALITY;
	}
	public void setReview_QUALITY(int review_QUALITY) {
		this.review_QUALITY = review_QUALITY;
	}
	public int getTrade_NO() {
		return trade_NO;
	}
	public void setTrade_NO(int trade_NO) {
		this.trade_NO = trade_NO;
	}
	
	
	
	
}
