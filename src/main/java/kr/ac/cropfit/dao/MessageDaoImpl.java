package kr.ac.cropfit.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.cropfit.model.Message;

@Repository
public class MessageDaoImpl implements MessageDao {

	@Autowired
	SqlSession sql;


	
	@Override
	public void sendMsg(Message sendMsg) {
		sql.insert("message.sendMsg", sendMsg);
	}

	@Override
	public List<Message> messageRecievedList(String user_ID) {
		return sql.selectList("message.messageRecievedList",user_ID);
	}

	@Override
	public List<Message> messageSendList(String user_ID) {
		return sql.selectList("message.messageSendList",user_ID);
	}

	@Override
	public List<Message> messageDeletedList(String user_ID) {
		return sql.selectList("message.messageDeletedList",user_ID);
	}

	@Override
	public void recievedMsgAnswerChng(int msg_NO) {
		sql.update("message.recievedMsgAnswerChng", msg_NO);
	}
	
	@Override
	public int sendMsgReply(Message sendMsgReply) {
		return sql.insert("message.sendMsgReply", sendMsgReply);
	}

	@Override
	public void msgCheckStatusChange(int msg_NO) {
		sql.update("message.msgCheckStatusChange", msg_NO);
	}

	@Override
	public void msgDelete(int msg_NO) {
		sql.update("message.msgDelete", msg_NO);
	}

	@Override
	public void msgRestore(int msg_NO) {
		sql.update("message.msgRestore", msg_NO);
	}


	
	
}
