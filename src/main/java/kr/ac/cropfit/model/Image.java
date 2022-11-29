package kr.ac.cropfit.model;

import java.util.Date;

public class Image {
	
	String user_ID;

	int trade_NO;
	String img_KIND;
	Date img_CREATE_DT;
	String img_CHNG_NM;
	String img_ORGN_NM;
	String img_STATUS;
	String img_PATH;
	int img_THUMBNAIL;
	int img_NO;
	int board_NO;
	int review_NO;

	
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
	public String getImg_KIND() {
		return img_KIND;
	}
	public void setImg_KIND(String img_KIND) {
		this.img_KIND = img_KIND;
	}
	public Date getImg_CREATE_DT() {
		return img_CREATE_DT;
	}
	public void setImg_CREATE_DT(Date img_CREATE_DT) {
		this.img_CREATE_DT = img_CREATE_DT;
	}
	public String getImg_CHNG_NM() {
		return img_CHNG_NM;
	}
	public void setImg_CHNG_NM(String img_CHNG_NM) {
		this.img_CHNG_NM = img_CHNG_NM;
	}
	public String getImg_ORGN_NM() {
		return img_ORGN_NM;
	}
	public void setImg_ORGN_NM(String img_ORGN_NM) {
		this.img_ORGN_NM = img_ORGN_NM;
	}
	public String getImg_STATUS() {
		return img_STATUS;
	}
	public void setImg_STATUS(String img_STATUS) {
		this.img_STATUS = img_STATUS;
	}
	public String getImg_PATH() {
		return img_PATH;
	}
	public void setImg_PATH(String img_PATH) {
		this.img_PATH = img_PATH;
	}
	public int getImg_THUMBNAIL() {
		return img_THUMBNAIL;
	}
	public void setImg_THUMBNAIL(int img_THUMBNAIL) {
		this.img_THUMBNAIL = img_THUMBNAIL;
	}
	public int getImg_NO() {
		return img_NO;
	}
	public void setImg_NO(int img_NO) {
		this.img_NO = img_NO;
	}
	public int getBoard_NO() {
		return board_NO;
	}
	public void setBoard_NO(int board_NO) {
		this.board_NO = board_NO;
	}
	public int getReview_NO() {
		return review_NO;
	}
	public void setReview_NO(int review_NO) {
		this.review_NO = review_NO;
	}
	
	/*이미지업로드*/
	public Image(String img_CHNG_NM, String img_ORGN_NM, String img_PATH) {
		this.img_CHNG_NM = img_CHNG_NM;
		this.img_ORGN_NM = img_ORGN_NM;
		this.img_PATH = img_PATH;
	}
	public Image() {}
	
}
