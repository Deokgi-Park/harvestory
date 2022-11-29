package kr.ac.cropfit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.cropfit.common.Pager;
import kr.ac.cropfit.dao.BoardDao;
import kr.ac.cropfit.model.Board;
import kr.ac.cropfit.model.Image;
import kr.ac.cropfit.model.Reply;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao boardDao;

	/* 자유게시판 */
	
	@Override
	public List<Board> communityList(Pager pager) {
		int total = boardDao.total(pager);
		pager.setTotal(total);
		return boardDao.communityList(pager);
	}
	
	@Override
	public void communityWrite(Board boardWrite) {
		boardDao.communityWrite(boardWrite);
		
	}

	@Override
	public Board communityDetail(int board_NO) {
		return boardDao.communityDetail(board_NO);
	}

	@Override
	public void communityDetailUpdate(Board updateBoard) {
		boardDao.communityDetailUpdate(updateBoard);
	}

	@Override
	public void communityDelete(int board_NO) {
		boardDao.communityDelete(board_NO);
	}

	
	//////////////////////////////////////////////////////////////////////////////////////////
	/* 자유게시판 댓글 */
	
	@Override
	public List<Reply> communityReplyList(int board_NO) {
		return boardDao.communityReplyList(board_NO);
	}
	
	@Override
	public int communityReplyWrite(Reply replyWrite) {
		return boardDao.communityReplyWrite(replyWrite);
	}

	@Override
	public void communityReplyDelete(Reply replyDeleteInfo) {
		boardDao.communityReplyDelete(replyDeleteInfo);
	}

	@Override
	public int communityReplyUpdate(Reply replyUpdate) {
		return boardDao.communityReplyUpdate(replyUpdate);
	}
	
	
	//////////////////////////////////////////////////////////////////////////////////////////
	/* 자유게시판 이미지 */
	
	@Override
	public int selectBoardNo(Board boardWrite) {
		return boardDao.selectBoardNo(boardWrite);
	}

	@Override
	public int coummunityAddImage(List<Image> files) {
		return boardDao.coummunityAddImage(files);
	}

	
	//////////////////////////////////////////////////////////////////////////////////////////
	/* FAQ */
	
	@Override
	public List<Board> faqList(Pager pager) {
		int total = boardDao.total(pager);
		pager.setTotal(total);
		
		return boardDao.faqList(pager);
	}

	@Override
	public void faqWrite(Board faqWrite) {
		boardDao.faqWrite(faqWrite);
	}

	@Override
	public void faqDelete(int board_NO) {
		boardDao.faqDelete(board_NO);
	}

	@Override
	public Board faqUpdateInfo(int board_NO) {
		return boardDao.faqUpdateInfo(board_NO);
	}

	@Override
	public void faqUpdateRq(Board faqUpdateRq) {
		boardDao.faqUpdateRq(faqUpdateRq);
	}

	
	//////////////////////////////////////////////////////////////////////////////////////////
	/* 1 : 1 문의 */

	@Override
	public List<Board> myAskList(String user_ID) {
		return boardDao.myAskList(user_ID);
	}
	
	@Override
	public void askSend(Board askSendItem) {
		boardDao.askSend(askSendItem);
	}
	
	@Override
	public Board myAskItem(int board_NO) {
		return boardDao.myAskItem(board_NO);
	}


}
