package kr.ac.cropfit.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.cropfit.common.Pager;
import kr.ac.cropfit.model.Board;
import kr.ac.cropfit.model.Image;
import kr.ac.cropfit.model.Reply;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("board.total", pager);
	}
	
	
	/* 자유게시판  */

	@Override
	public List<Board> communityList(Pager pager) {
		return sql.selectList("board.communityList", pager);
	}

	
	@Override
	public void communityWrite(Board boardWrite) {
		sql.insert("board.communityWrite", boardWrite);
	}


	@Override
	public Board communityDetail(int board_NO) {
		return sql.selectOne("board.communityDetail", board_NO);
	}


	@Override
	public void communityDetailUpdate(Board updateBoard) {
		sql.update("board.communityDetailUpdate", updateBoard);
	}


	@Override
	public void communityDelete(int board_NO) {
		sql.update("board.communityDelete", board_NO);
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////
	/* 자유게시판 댓글  */

	@Override
	public List<Reply> communityReplyList(int board_NO) {
		return sql.selectList("board.communityReplyList", board_NO);
	}

	@Override
	public int communityReplyWrite(Reply replyWrite) {
		return sql.insert("board.communityReplyWrite", replyWrite);
	}


	@Override
	public void communityReplyDelete(Reply replyDeleteInfo) {
		sql.update("board.communityReplyDelete", replyDeleteInfo);
	}


	@Override
	public int communityReplyUpdate(Reply replyUpdate) {
		return sql.update("board.communityReplyUpdate", replyUpdate);
	}

	
	/* 자유게시판 이미지 */
	@Override
	public int selectBoardNo(Board boardWrite) {
		return sql.selectOne("image.selectBoardNo",boardWrite);
	}


	@Override
	public int coummunityAddImage(List<Image> files) {
		return sql.insert("image.coummunityAddImage",files);
	}


	//////////////////////////////////////////////////////////////////////////////////////////
	/* FAQ */
	
	@Override
	public List<Board> faqList(Pager pager) {
		return sql.selectList("board.faqList", pager);
	}


	@Override
	public void faqWrite(Board faqWrite) {
		sql.insert("board.faqWrite", faqWrite);
	}


	@Override
	public void faqDelete(int board_NO) {
		sql.update("board.faqDelete", board_NO);
	}


	@Override
	public Board faqUpdateInfo(int board_NO) {
		return sql.selectOne("board.faqUpdateInfo", board_NO);
	}


	@Override
	public void faqUpdateRq(Board faqUpdateRq) {
		sql.update("board.faqUpdateRq", faqUpdateRq);
	}





	//////////////////////////////////////////////////////////////////////////////////////////
	/* 1 : 1 문의 */
	
	
	@Override
	public List<Board> myAskList(String user_ID) {
		return sql.selectList("board.myAskList", user_ID);
	}
	
	@Override
	public void askSend(Board askSendItem) {
		sql.insert("board.askSend", askSendItem);
	}
	
	@Override
	public Board myAskItem(int board_NO) {
		return sql.selectOne("board.myAskItem", board_NO);
	}



	
}
