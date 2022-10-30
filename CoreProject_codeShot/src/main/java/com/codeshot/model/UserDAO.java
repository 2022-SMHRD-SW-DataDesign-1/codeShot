package com.codeshot.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codeshot.db.SqlSessionManager;

public class UserDAO 
{
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
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

}
