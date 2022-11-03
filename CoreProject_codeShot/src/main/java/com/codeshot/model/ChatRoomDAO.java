package com.codeshot.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codeshot.db.SqlSessionManager;

public class ChatRoomDAO 
{
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	
	public void showChatRoom(ChatRoomDTO dto) 
	{
		SqlSession session = sqlSessionFactory.openSession(true);
		session.close();
	}

}
