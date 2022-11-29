package kr.ac.cropfit.service;

import java.util.List;

import kr.ac.cropfit.common.Pager;
import kr.ac.cropfit.model.Image;
import kr.ac.cropfit.model.Trade;

public interface TradeService {

	/*
	 *  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 포전매매 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * */
	   /* 상품 리스트 */
	   List<Trade> tradeList(Pager pager);
	   
	   /* 나의 거래 리스트 */
	   List<Trade> tradeMyList(String user_ID);
	   
	   /* 상품 등록 */
	   int tradeAdd(Trade tradeAddItem, List<Image> files);

	   /* 상품 삭제 */
	   void tradeDelete(int trade_NO);
	   
	   /* 상품 업데이트 */
	   Trade tradeUpdateItem(int trade_NO);

	   int tradeUpdate(Trade trade);

	   int tradeUpdateImage(List<Image> files);
	   
	   /* 상품 상세페이지 */
	   Trade tradeDetail(int trade_NO);

	   List<Trade> otherTrade(Trade trade);

	   List<Image> tradeDetailImage(int trade_NO);



	
	/*
	 *  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 비규격품 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * */
	
	int nspWrite(Trade nspWriteItem, List<Image> files);

	List<Trade> nspList(Pager pager);

	Trade nspDetailItem(int trade_NO);

	List<Image> nspDetailImages(int trade_NO);

	void nspDelete(int trade_NO);

	void originImgDelete(int img_NO);

	int nspUpdate(Trade nspUpdateItem, List<Image> files);
	
	
	
	
	
	
	
	
	
	/*
	 *  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 크라우드 펀딩 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * */

}
