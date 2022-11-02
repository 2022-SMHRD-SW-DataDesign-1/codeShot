package com.codeshot.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codeshot.db.SqlSessionManager;

public class UserDAO 
{
	
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	
	public int joinClient(UserDTO dto) 
	{
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int row = session.insert("joinClient", dto);
		
		session.close();
		
		return row;
	}
	
	public int joinExpert(UserDTO dto) 
	{
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int row = session.insert("joinExpert", dto);
		
		session.close();
		
		return row;
	}
	
	public UserDTO login(UserDTO dto) 
	{
		SqlSession session = sqlSessionFactory.openSession(true);
		
		UserDTO info = session.selectOne("login", dto);
		
		session.close();
		
		return info;
	}
	
	public int updateInfo(UserDTO dto) 
	{
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int row = session.update("updateInfo", dto);
		
		session.close();
		
		return row;
	}
	
	public boolean checkSameEmail(String inputE) 
	{
		SqlSession session = sqlSessionFactory.openSession(true);
		
		boolean checkEmail = session.selectOne("checkSameEmail", inputE);
		
		session.close();
		
		return checkEmail;
	}
	
	public int withdrawal(String email) 
	{
		SqlSession session = sqlSessionFactory.openSession(true);
		
		int row = session.delete("withdrawal", email);
		
		session.close();
		
		return row;
	}

}
