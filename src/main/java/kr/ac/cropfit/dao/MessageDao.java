package kr.ac.cropfit.dao;

import java.util.List;

import kr.ac.cropfit.model.Message;

public interface MessageDao {

	void sendMsg(Message sendMsg);
	List<Message> messageRecievedList(String user_ID);
	List<Message> messageSendList(String user_ID);
	List<Message> messageDeletedList(String user_ID);
	void recievedMsgAnswerChng(int msg_NO);
	int sendMsgReply(Message sendMsgReply);
	void msgCheckStatusChange(int msg_NO);
	void msgDelete(int msg_NO);
	void msgRestore(int msg_NO);


}
