package kr.ac.cropfit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.cropfit.model.Member;
import kr.ac.cropfit.model.Message;
import kr.ac.cropfit.service.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {

	@Autowired
	MessageService msgService;

	/** 메세지 리스트 출력 -- 수신 / 발신 / 삭제
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/messageList")
	String messageList(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		String user_ID = loginMember.getUser_ID();

		System.out.println("세션에서 받아 온 user_ID : " + user_ID);

		List<Message> messageRecievedList = msgService.messageRecievedList(user_ID);
		model.addAttribute("messageRecievedList", messageRecievedList);

		List<Message> messageSendList = msgService.messageSendList(user_ID);
		model.addAttribute("messageSendList", messageSendList);

		List<Message> messageDeletedList = msgService.messageDeletedList(user_ID);
		model.addAttribute("messageDeletedList", messageDeletedList);

		return "message";
	}

	/** communityDetail --> 메세지 신규 전송
	 * @param sendMsg
	 * @param model
	 * @param board_NO
	 * @return
	 */
	@PostMapping("/sendMessage")
	String sendMessage(Message sendMsg, Model model, int board_NO) {

		msgService.sendMsg(sendMsg);
		model.addAttribute("msg", "쪽지 전송 완료");

		return "redirect:/board/communityDetail?board_NO=" + board_NO;
	}

	/** 수신메세지함 --> 답장 전송
	 * @param sendMsgReply
	 * @param model
	 * @return
	 */
	@PostMapping("/sendMessageReply")
	String sendMessageReply(Message sendMsgReply, Model model) {

		int sendMsgReplyRS = msgService.sendMsgReply(sendMsgReply);

		if (sendMsgReplyRS < 1)
			model.addAttribute("msg", "답장 전송 실패");
		else
			model.addAttribute("msg", "답장 전송 완료");

		return "redirect:messageList";
	}

	/** Header용 -- 메세지 클릭 시 확인 Status 변경(Ajax)
	 * @param msg_NO
	 */
	@PostMapping("/msgCheckStatusChange")
	void msgCheckStatusChange(int msg_NO) {
		msgService.msgCheckStatusChange(msg_NO);
	}
	
	
	/** 메세지 삭제
	 * @param msg_NO
	 * @return
	 */
	@GetMapping("/msgDelete")
	String msgDelete(int msg_NO) { 
		
		msgService.msgDelete(msg_NO);
		
		return "redirect:messageList";
	}
	
	
	/** 삭제한 메세지 STATUS 재변경
	 * @param msg_NO
	 * @return
	 */
	@GetMapping("/msgRestore")
	String msgRestore(int msg_NO) { 
		
		msgService.msgRestore(msg_NO);
		
		return "redirect:messageList";
	}
	
	
}
