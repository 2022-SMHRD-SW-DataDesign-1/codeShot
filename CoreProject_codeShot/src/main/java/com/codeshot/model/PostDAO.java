package com.codeshot.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codeshot.db.SqlSessionManager;

public class PostDAO 
{
	
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<PostDTO> showPost() 
	{
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PostDTO> postList = session.selectList("showPost");
		session.close();
		return postList;
	}

}
