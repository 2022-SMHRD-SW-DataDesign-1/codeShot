package com.codeshot.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codeshot.db.SqlSessionManager;

public class ChatDAO 
{
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	
	public List<ChatRoomDTO> showChatRoom(String email) 
	{
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List<ChatRoomDTO> chatRoomList = session.selectList("showChatRoom", email);
		
		session.close();
		
		return chatRoomList;
	}
	
	public List<ChattingDTO> showChatting(int roomNum) 
	{
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List<ChattingDTO> chattingList = session.selectList("showChatting", roomNum);
		
		session.close();
		
		return chattingList;
	}

}
