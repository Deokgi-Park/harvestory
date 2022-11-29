package kr.ac.cropfit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.cropfit.common.Pager;
import kr.ac.cropfit.dao.TradeDao;
import kr.ac.cropfit.model.Image;
import kr.ac.cropfit.model.Trade;

@Service
public class TradeServiceImpl implements TradeService {

	@Autowired
	TradeDao tradeDao;

	
	
	/*
	 *  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 포전매매 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * */
	
	/* 상품 리스트 */
	   @Override
	   public List<Trade> tradeList(Pager pager) {
	      int total = tradeDao.total(pager);
	      pager.setTotal(total);
	      return tradeDao.tradeList(pager);
	   }

	   @Override
	   public List<Trade> tradeMyList(String user_ID) {
	      return tradeDao.tradeMyList(user_ID);
	   }


	   /* 상품 등록 */
	   @Override
	   public int tradeAdd(Trade tradeAddItem,List<Image> files) {
	      int result= 0;
	      int trade_NO = tradeDao.tradeNextVal(tradeAddItem);
	      
	      tradeAddItem.setTrade_NO(trade_NO);
	      
	      if(trade_NO > 0) {
	         tradeDao.tradeAdd(tradeAddItem);
	      }
	      
	       if (trade_NO > 0  && files.isEmpty()) { // 게시판 삽입을 성공하고 파일이 없으면  게시글 번호 바로 반환
	            result = trade_NO;
	         }
	       if (trade_NO > 0 && !  files.isEmpty()) { // 게시판 글 내용 삽입 성공했고 파일이 있으면

	             for (Image img : files) {
	              
	                img.setTrade_NO(trade_NO); // 게시글 번호 set 
	                result = tradeDao.tradeAddImage(img);
	                
	                // 해당 게시글에 파일을 삽입하고
	                if (result == 0) { // 파일 삽입을 실패했을 경우
	                  return 0;
	                }
	             }
	             result = trade_NO;
	          }

	      return result;
	   }

	   /* 상품 삭제 */
	   @Override
	   public void tradeDelete(int trade_NO) {
	      tradeDao.tradeDelete(trade_NO);
	   }
	   
	   /* 상품 업데이트 */
	   @Override
	   public Trade tradeUpdateItem(int trade_NO) {
	      return tradeDao.tradeUpdateItem(trade_NO);
	   }
	   @Override
	   public int tradeUpdate(Trade trade) {
	      return tradeDao.tradeUpdate(trade);
	   }
	   @Override
	   public int tradeUpdateImage(List<Image> files) {
	      return tradeDao.tradeUpdateImage(files);
	   }
	   
	   /* 상품 상세페이지 */
	   
	   @Override
	   public List<Trade> otherTrade(Trade trade) {
	      return tradeDao.otherTrade(trade);
	   }
	   @Override
	   public List<Image> tradeDetailImage(int trade_NO) {
	      return tradeDao.tradeDetailImage(trade_NO);
	   }

	   @Override
	   public Trade tradeDetail(int trade_NO) {
	      return tradeDao.tradeDetail(trade_NO);
	   }

	
	
	
	
	
	/*
	 *  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 비규격품 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * */
	
	
	@Override
	public int nspWrite(Trade nspWriteItem, List<Image> files) {
		
		int result = 0;
		int trade_NO = tradeDao.nspNextVal(); 
		System.out.println("trade_NO = " + trade_NO);
		
		nspWriteItem.setTrade_NO(trade_NO);
		
		if (trade_NO > 0) {		
			 tradeDao.nspWrite(nspWriteItem); // 게시글 삽입 결과
		}
		
		if (trade_NO > 0  && files.isEmpty()) { // 게시판 삽입을 성공하고 파일이 없으면  게시글 번호 바로 반환
			System.out.println("파일이 비어있음");
			result = trade_NO;
		}
		
		if (trade_NO > 0 && !files.isEmpty()) { // 게시판 글 내용 삽입 성공했고 파일이 있으면
			for (Image img : files) {
				img.setTrade_NO(trade_NO);
				result = tradeDao.insertNspImage(img);
				
				// 해당 게시글에 파일을 삽입하고
				if (result == 0) { // 파일 삽입을 실패했을 경우
					return 0;
				}
			}
			result = trade_NO;
		}

		return result;
	}

	@Override
	public List<Trade> nspList(Pager pager) {
		int total = tradeDao.total(pager);
		pager.setTotal(total);
		return tradeDao.nspList(pager);
	}

	@Override
	public Trade nspDetailItem(int trade_NO) {
		return tradeDao.nspDetailItem(trade_NO);
	}

	@Override
	public List<Image> nspDetailImages(int trade_NO) {
		return tradeDao.nspDetailImages(trade_NO);
	}

	@Override
	public void nspDelete(int trade_NO) {
		tradeDao.nspDelete(trade_NO);
	}

	@Override
	public void originImgDelete(int img_NO) {
		tradeDao.originImgDelete(img_NO);
	}

	@Override
	public int nspUpdate(Trade nspUpdateItem, List<Image> files) {
		
		int result = tradeDao.nspUpdate(nspUpdateItem); // 게시글 삽입 결과
	
		if (result < 1 && files.isEmpty()) { // 게시판 삽입을 성공하고 파일이 없으면  게시글 번호 바로 반환
			System.out.println("파일이 비어있음");
		}
		
		if (result > 0 && !files.isEmpty()) { // 게시판 글 내용 삽입 성공했고 파일이 있으면
			for (Image img : files) {
				img.setTrade_NO(nspUpdateItem.getTrade_NO());
				tradeDao.insertNewNspImage(img);
			}
		}
		
		return result;
	}

	
	
	
	
	/*
	 *  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 크라우드 펀딩 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * */
	
	
	
	
}
