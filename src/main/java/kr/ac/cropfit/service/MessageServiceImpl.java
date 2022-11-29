package kr.ac.cropfit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.cropfit.dao.MessageDao;
import kr.ac.cropfit.model.Message;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageDao msgDao;
	
	@Override
	public void sendMsg(Message sendMsg) {
		msgDao.sendMsg(sendMsg);
	}

	@Override
	public List<Message> messageRecievedList(String user_ID) {
		return msgDao.messageRecievedList(user_ID);
	}

	@Override
	public List<Message> messageSendList(String user_ID) {
		return msgDao.messageSendList(user_ID);	
	}

	@Override
	public List<Message> messageDeletedList(String user_ID) {
		return msgDao.messageDeletedList(user_ID);
	}

	@Override
	public int sendMsgReply(Message sendMsgReply) {
		
		msgDao.recievedMsgAnswerChng(sendMsgReply.getMsg_NO());
		
		return msgDao.sendMsgReply(sendMsgReply);
	}

	@Override
	public void msgCheckStatusChange(int msg_NO) {
		msgDao.msgCheckStatusChange(msg_NO);
	}

	@Override
	public void msgDelete(int msg_NO) {
		msgDao.msgDelete(msg_NO);
	}

	@Override
	public void msgRestore(int msg_NO) {
		msgDao.msgRestore(msg_NO);
	}

	
	
}
