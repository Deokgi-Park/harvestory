package kr.ac.cropfit.service;

import java.util.List;

import kr.ac.cropfit.model.Message;

public interface MessageService {

	void sendMsg(Message sendMsg);
	
	List<Message> messageRecievedList(String user_ID);
	List<Message> messageSendList(String user_ID);
	List<Message> messageDeletedList(String user_ID);

	int sendMsgReply(Message sendMsgReply);

	void msgCheckStatusChange(int msg_NO);

	void msgDelete(int msg_NO);

	void msgRestore(int msg_NO);


}
