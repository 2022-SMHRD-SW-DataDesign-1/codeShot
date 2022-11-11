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
	
	public String getChattingTitle(int roomNum) 
	{
		SqlSession session = sqlSessionFactory.openSession(true);
		
		String chattingTitle = session.selectOne("getChattingTitle", roomNum);
		
		session.close();
		
		return chattingTitle;
	}
	
	public int inputChat(ChattingDTO chat) 
	{
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int row = session.insert("inputChat", chat);
		
		session.close();
		
		return row;
	}
	
	public int createChatRoom(ChatRoomDTO dto) 
	{
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int row = session.insert("createChatRoom", dto);
		
		session.close();
		
		return row;
	}
	
	public UserDTO getSellerInfo(String sellerEmail) {
		SqlSession session = sqlSessionFactory.openSession(true);
		
		UserDTO sellerInfo = session.selectOne("getSellerInfo", sellerEmail);
		
		session.close();
		
		return sellerInfo;
	}

}
