package kr.ac.cropfit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.cropfit.common.Pager;
import kr.ac.cropfit.model.Board;
import kr.ac.cropfit.model.Reply;
import kr.ac.cropfit.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;

	final String path = "community/";
	
	final String path2 = "faq/";
	
	/* 자유게시판 */
	
	/** 자유게시판 리스트 출력
	 * @param pager
	 * @param model
	 * @return
	 */
	@RequestMapping("/communityList")
	String communityList(Pager pager,Model model) {
		
		List<Board> boardList = boardService.communityList(pager);
		model.addAttribute("boardList", boardList);
		
		return path + "communityList";
	}
	
	@GetMapping("/communityWrite")
	String communityWrite() {
		return path + "communityWrite";
	}
	
	
	/** 자유게시판 글 작성
	 * @param boardWrite
	 * @param request
	 * @param model
	 * @param session
	 * @return
	 */
	@PostMapping("/communityWrite")
	String communityWrite(Board boardWrite, HttpServletRequest request, Model model, HttpSession session) {
		boardService.communityWrite(boardWrite);
	
		return "redirect:../board/communityList";
	}
	
	
	
	/** 자유게시판 상세페이지 이동
	 * @param board_NO
	 * @param model
	 * @return
	 */
	@GetMapping("/communityDetail")
	String communityDetail(int board_NO, Model model) {
		
		System.out.println("받은 글번호: " + board_NO);
		
		Board communityDetail = boardService.communityDetail(board_NO);
		model.addAttribute("communityDetail", communityDetail);
		
		// Detail 이동 시 댓글 목록 출력
		List<Reply> communityReplyList = boardService.communityReplyList(board_NO);
		model.addAttribute("communityReplyList", communityReplyList);
		
		return path + "communityDetail";
	}
	
	
	@GetMapping("/communityUpdate")
	String communityUpdate(int board_NO, Model model) {
		System.out.println("받은 글번호: " + board_NO);
		
		Board communityDetail = boardService.communityDetail(board_NO);
		model.addAttribute("communityDetail", communityDetail);
				
		return path + "communityUpdate";
	}
	
	
	
	/** 자유게시판 글 수정 
	 * @param updateBoard
	 * @param model
	 * @return
	 */
	
	@PostMapping("/communityUpdate")
	String communityUpdate(Board updateBoard, Model model) {
		
		 boardService.communityDetailUpdate(updateBoard);
		 
		 Board communityDetail = boardService.communityDetail(updateBoard.getBoard_NO());
		 model.addAttribute("communityDetail", communityDetail);
		
		return path + "communityDetail";
	}
	
	/** 자유게시판 글 삭제
	 * @param board_NO
	 * @return
	 */
	
	
	
	@GetMapping("/communityDelete")
	String communityDelete(int board_NO) {
		
		boardService.communityDelete(board_NO);
		
		return "redirect:../board/communityList";
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////
	/* 자유게시판 댓글 작성 */
	
	/** 자유게시판 댓글 리스트 ajax
	 */
	
	
	@PostMapping("/communityReplyList")
	@ResponseBody
	List<Reply> communityDetail(int board_NO) {
		return boardService.communityReplyList(board_NO);
	}
	
	
	/** 자유게시판 댓글 작성 -- Ajax
	 * @param replyWrite
	 * @return
	 */
	@PostMapping("/communityReplyWrite")
	@ResponseBody
	String communityReplyWrite(@RequestBody Reply replyWrite) {
		
		int result = boardService.communityReplyWrite(replyWrite);

		if(result < 0)
			return "ERROR";
	
		return "OK";
	}
	
	/** 자유게시판 댓글 삭제
	 * @param reply_NO
	 * @param board_NO
	 * @return
	 */
	@GetMapping("/communityReplyDelete")
	String communityReplyDelete(int reply_NO, int board_NO) {
				
		Reply replyDeleteInfo = new Reply();
		replyDeleteInfo.setBoard_NO(board_NO);
		replyDeleteInfo.setReply_NO(reply_NO);
		
		boardService.communityReplyDelete(replyDeleteInfo);
		
		return "redirect:../board/communityDetail?board_NO=" + board_NO;
	}
	
	
	/** 자유게시판 댓글 수정(JSP 진행 중)
	 * @param replyUpdate
	 * @return
	 */
	@PostMapping("/communityReplyUpdate")
	@ResponseBody
	String communityReplyUpdate(@RequestBody Reply replyUpdate) {
		
		int result = boardService.communityReplyUpdate(replyUpdate);

		if(result == 0)
			return "ERROR";
	
		return "OK";
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////
	/* FAQ */
	
	/** FAQ 리스트 출력
	 * @param pager
	 * @param model
	 * @return
	 */
	@RequestMapping("/faqList")
	String faqList(Pager pager, Model model) {
		List<Board> faqList = boardService.faqList(pager);
		
		model.addAttribute("faqList", faqList);
		return path2 + "faqList";
	}
	
	@GetMapping("/faqWrite")
	String faqWrite() {
		return path2 + "faqWrite";
	}
	
	/** FAQ 글 작성
	 * @param faqWrite
	 * @return
	 */
	@PostMapping("/faqWrite")
	String faqWrite(Board faqWrite) {
		boardService.faqWrite(faqWrite);
		
		return "redirect:/board/faqList";
	}
	
	
	/** FAQ 글 삭제
	 * @param board_NO
	 * @return
	 */
	@GetMapping("/faqDelete")
	String faqDelete(int board_NO) {
		boardService.faqDelete(board_NO);
		return "redirect:/board/faqList";
	}
	

	@GetMapping("/faqUpdate")
	String faqUpdate(int board_NO, Model model) {
		Board updateFaqInfo = boardService.faqUpdateInfo(board_NO);
		model.addAttribute("updateFaqInfo", updateFaqInfo);
		
		return path2 + "faqUpdate";
	}
	
	/** FAQ 글 수정
	 * @param faqUpdateRq
	 * @return
	 */
	@PostMapping("/faqUpdate")
	String faqUpdate(Board faqUpdateRq) {
		boardService.faqUpdateRq(faqUpdateRq);
		
		return "redirect:/board/faqList";
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////
	/* 1 : 1 문의 */
	
	/** 1:1 문의 신규 등록 
	 * @param askSendItem
	 * @return
	 */
	@PostMapping("/askSend")
	String askSend(Board askSendItem) {
		boardService.askSend(askSendItem);
		
		return "redirect:/myPage";
	}
	@PostMapping("/myAskItem")
	@ResponseBody
	Board myAskItem(int board_NO) {
		Board result =  boardService.myAskItem(board_NO);
		return result; 
	}
		
	
}
