package kr.ac.cropfit.model;

import java.util.Date;

public class Trade {
   
   int trade_NO;
   String user_ID;
   int price_NO;
   String  product_TITLE;
   String product_CONTENT;
   int product_PRICE;
   int product_CATEGORY;
   int product_KIND;
   String product_STATUS;
   Date product_DATE;
   String user_NAME;
   String img_CHNG_NM;
   String img_KIND;
   int img_NO;
   String item_NAME;
   //펀딩
   
   String funding_MINIMUM;
   Date funding_PERIOD;
   Date funding_PERIOD_END;
   Date harvest_SCHEDULED;
   String funding_PARTICIPANTS;
   
   
   
   
   
   public int getPrice_NO() {
      return price_NO;
   }
   public void setPrice_NO(int price_NO) {
      this.price_NO = price_NO;
   }
   public int getTrade_NO() {
      return trade_NO;
   }
   public void setTrade_NO(int trade_NO) {
      this.trade_NO = trade_NO;
   }
   public String getProduct_TITLE() {
      return product_TITLE;
   }
   public void setProduct_TITLE(String product_TITLE) {
      this.product_TITLE = product_TITLE;
   }
   public String getProduct_CONTENT() {
      return product_CONTENT;
   }
   public void setProduct_CONTENT(String product_CONTENT) {
      this.product_CONTENT = product_CONTENT;
   }
   public int getProduct_PRICE() {
      return product_PRICE;
   }
   public void setProduct_PRICE(int product_PRICE) {
      this.product_PRICE = product_PRICE;
   }
   
   
   public String getImg_CHNG_NM() {
      return img_CHNG_NM;
   }
   public void setImg_CHNG_NM(String img_CHNG_NM) {
      this.img_CHNG_NM = img_CHNG_NM;
   }
   public int getProduct_CATEGORY() {
      return product_CATEGORY;
   }
   public void setProduct_CATEGORY(int product_CATEGORY) {
      this.product_CATEGORY = product_CATEGORY;
   }
   public int getProduct_KIND() {
      return product_KIND;
   }
   public void setProduct_KIND(int product_KIND) {
      this.product_KIND = product_KIND;
   }
   public String getProduct_STATUS() {
      return product_STATUS;
   }
   public void setProduct_STATUS(String product_STATUS) {
      this.product_STATUS = product_STATUS;
   }
   public Date getProduct_DATE() {
      return product_DATE;
   }
   public void setProduct_DATE(Date product_DATE) {
      this.product_DATE = product_DATE;
   }
   public String getUser_ID() {
      return user_ID;
   }
   public void setUser_ID(String user_ID) {
      this.user_ID = user_ID;
   }
   public String getUser_NAME() {
      return user_NAME;
   }
   public void setUser_NAME(String user_NAME) {
      this.user_NAME = user_NAME;
   }
   
   public String getImg_KIND() {
      return img_KIND;
   }
   public void setImg_KIND(String img_KIND) {
      this.img_KIND = img_KIND;
   }
   
   
   
   public int getImg_NO() {
      return img_NO;
   }
   public void setImg_NO(int img_NO) {
      this.img_NO = img_NO;
   }
   public String getFunding_MINIMUM() {
      return funding_MINIMUM;
   }
   public void setFunding_MINIMUM(String funding_MINIMUM) {
      this.funding_MINIMUM = funding_MINIMUM;
   }
   public Date getFunding_PERIOD() {
      return funding_PERIOD;
   }
   public void setFunding_PERIOD(Date funding_PERIOD) {
      this.funding_PERIOD = funding_PERIOD;
   }
   public Date getFunding_PERIOD_END() {
      return funding_PERIOD_END;
   }
   public void setFunding_PERIOD_END(Date funding_PERIOD_END) {
      this.funding_PERIOD_END = funding_PERIOD_END;
   }
   public Date getHarvest_SCHEDULED() {
      return harvest_SCHEDULED;
   }
   public void setHarvest_SCHEDULED(Date harvest_SCHEDULED) {
      this.harvest_SCHEDULED = harvest_SCHEDULED;
   }
   public String getFunding_PARTICIPANTS() {
      return funding_PARTICIPANTS;
   }
   public void setFunding_PARTICIPANTS(String funding_PARTICIPANTS) {
      this.funding_PARTICIPANTS = funding_PARTICIPANTS;
   }
public String getItem_NAME() {
	return item_NAME;
}
public void setItem_NAME(String item_NAME) {
	this.item_NAME = item_NAME;
}
   
   
   
   
   
   
   

}