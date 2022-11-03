package com.codeshot.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codeshot.db.SqlSessionManager;

public class ChatRoomDAO 
{
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	
	public List<ChatRoomDTO> showChatRoom(String email) 
	{
		SqlSession session = sqlSessionFactory.openSession(true);
		
		List<ChatRoomDTO> chatRoomList = session.selectList("showChatRoom", email);
		
		session.close();
		
		return chatRoomList;
	}

}
