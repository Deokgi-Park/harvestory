package kr.ac.cropfit.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.cropfit.common.Pager;
import kr.ac.cropfit.model.Image;
import kr.ac.cropfit.model.Trade;

@Repository
public class TradeDaoImpl implements TradeDao {

	@Autowired
	SqlSession sql;

	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("trade.total", pager);
	}

	
	
	/*
	 *  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 포전매매 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * */

	   /* 상품 리스트 */
	   @Override
	   public List<Trade> tradeList(Pager pager) {
	      return sql.selectList("trade.tradeList",pager);
	   }
	   
	   /* 나의 상품 리스트 */
	   @Override
	   public List<Trade> tradeMyList(String user_ID) {
	      return sql.selectList("trade.tradeMyList",user_ID);
	   }

	   /* 상품 등록 */
	   @Override
	   public int tradeAdd(Trade trade) {
	      return sql.insert("trade.tradeAdd",trade);
	   }


	   @Override
	   public int tradeAddImage(Image img) {
	      return sql.insert("image.tradeAddImage",img);
	   }

	   @Override
	   public int tradeNextVal(Trade tradeAddItem) {
	      return sql.selectOne("trade.tradeNextVal",tradeAddItem);
	   }

	   
	   /* 상품 삭제 */
	   @Override
	   public void tradeDelete(int trade_NO) {
	      sql.update("trade.tradeDelete",trade_NO);
	   }
	   
	   /* 상품 업데이트 */
	   @Override
	   public Trade tradeUpdateItem(int trade_NO) {
	      return sql.selectOne("trade.tradeUpdateItem",trade_NO);
	   }

	   @Override
	   public int tradeUpdate(Trade trade) {
	      return sql.update("trade.tradeUpdate", trade);
	   }

	   @Override
	   public int tradeUpdateImage(List<Image> files) {
	      return sql.update("image.tradeUpdateImage", files);
	   }
	   
	   /* 상품 상세페이지 */

	   @Override
	   public List<Trade> otherTrade(Trade trade) {
	      return sql.selectList("trade.otherTrade",trade);
	   }

	   @Override
	   public Trade tradeDetail(int trade_NO) {
	      return sql.selectOne("trade.tradeDetail",trade_NO);
	   }

	   @Override
	   public List<Image> tradeDetailImage(int trade_NO) {
	      return sql.selectList("image.tradeDetailImage",trade_NO);
	   }
	
	
	
	
	
	
	/*
	 *  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 비규격품 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * */
	
	@Override
	public void nspWrite(Trade nspWriteItem) {
		sql.insert("trade.nspWrite", nspWriteItem);
	}

	@Override
	public int nspNextVal() {
		return sql.selectOne("trade.nspNextVal");
	}

	@Override
	public int insertNspImage(Image img) {
		return sql.insert("image.insertNspImage", img);
	}

	@Override
	public List<Trade> nspList(Pager pager) {
		return sql.selectList("trade.nspList", pager);
	}

	@Override
	public Trade nspDetailItem(int trade_NO) {
		return sql.selectOne("trade.nspDetailItem", trade_NO);
	}

	@Override
	public List<Image> nspDetailImages(int trade_NO) {
		return sql.selectList("image.nspDetailImages", trade_NO);
	}

	@Override
	public void nspDelete(int trade_NO) {
		 sql.update("trade.nspDelete", trade_NO);
	}

	@Override
	public void originImgDelete(int img_NO) {
		sql.update("image.originImgDelete", img_NO);
	}

	@Override
	public int nspUpdate(Trade nspUpdateItem) {
		return sql.update("trade.nspUpdate", nspUpdateItem);
	}

	@Override
	public void insertNewNspImage(Image img) {
		sql.insert("image.insertNewNspImage", img);
		
	}
	
	
	
	
	/*
	 *  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 크라우드 펀딩 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * */
	
	
	
}

