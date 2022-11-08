package com.codeshot.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codeshot.db.SqlSessionManager;

public class PortfolioDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	//2022-11-07-고정연/포트폴리오 등록
	public int uploadPortfolio(PortfolioDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		System.out.println(dto);
		int row = session.insert("uploadPortfolio",dto);
		session.close();
		return row;
	}
	
	//2022-11-08-고정연/포트폴리오 출력
	public List<PortfolioDTO> showPortfolio(String mem_email){
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PortfolioDTO> portfolioList = session.selectList("showPortfolio", mem_email);
		session.close();
		return portfolioList;
	}
}
