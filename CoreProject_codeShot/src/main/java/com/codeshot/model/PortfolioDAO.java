package com.codeshot.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codeshot.db.SqlSessionManager;

public class PortfolioDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	//2022-11-07-고정연/포트폴리오 등록
	public int uploadPortfolio(PortfolioDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("uploadPortfolio",dto);
		session.close();
		return row;
	}
}
