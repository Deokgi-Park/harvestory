package kr.ac.cropfit.service;

import java.util.List;

import kr.ac.cropfit.common.Pager;
import kr.ac.cropfit.model.Board;
import kr.ac.cropfit.model.Image;
import kr.ac.cropfit.model.Reply;

public interface BoardService {
	

	/* 자유게시판 */
	
	List<Board> communityList(Pager pager);

	void communityWrite(Board boardWrite);

	Board communityDetail(int board_NO);

	void communityDetailUpdate(Board updateBoard);

	void communityDelete(int board_NO);

	//////////////////////////////////////////////////////////////////////////////////////////
	/* 자유게시판 댓글 */
	
	List<Reply> communityReplyList(int board_NO);

	int communityReplyWrite(Reply replyWrite);

	void communityReplyDelete(Reply replyDeleteInfo);

	int communityReplyUpdate(Reply replyUpdate);

	//////////////////////////////////////////////////////////////////////////////////////////
	/* 자유게시판 이미지 */
	
	int selectBoardNo(Board boardWrite);

	int coummunityAddImage(List<Image> files);

	
	//////////////////////////////////////////////////////////////////////////////////////////
	/* FAQ */
	
	List<Board> faqList(Pager pager);

	void faqWrite(Board faqWrite);

	void faqDelete(int board_NO);

	Board faqUpdateInfo(int board_NO);

	void faqUpdateRq(Board faqUpdateRq);


	//////////////////////////////////////////////////////////////////////////////////////////
	/* 1 : 1 문의 */
	
	List<Board> myAskList(String user_ID); // RootController
	
	void askSend(Board askSendItem);

	Board myAskItem(int board_NO); 

}
