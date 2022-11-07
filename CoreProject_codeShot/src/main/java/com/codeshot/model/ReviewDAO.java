package com.codeshot.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codeshot.db.SqlSessionManager;

public class ReviewDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<ReviewDTO> starratingList() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<ReviewDTO> starratingList = session.selectList("starratingList");
		session.close();
		return starratingList;
	}
}
