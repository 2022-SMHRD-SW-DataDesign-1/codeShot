package com.codeshot.model;

import java.math.BigDecimal;
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
	
	//2022-11-08-고정연/포트폴리오 출력(글쓴이 이메일)
	public List<PortfolioDTO> showWriterPortfolio(String mem_email){
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PortfolioDTO> portfolioList = session.selectList("showWriterPortfolio", mem_email);
		session.close();
		return portfolioList;
	}
	
	//2022-11-09-고정연/포트폴리오 출력(포트폴리오 번호)
	public PortfolioDTO showPortfolioOne(BigDecimal pf_num){
		SqlSession session = sqlSessionFactory.openSession(true);
		PortfolioDTO portfolio = session.selectOne("showPortfolioOne", pf_num);
		session.close();
		return portfolio;
	}
	
	//2022-11-09-고정연/게시물 이미지 출력
	public PortfolioDTO showImage(String mem_email){
		SqlSession session = sqlSessionFactory.openSession(true);
		PortfolioDTO portfolio = session.selectOne("showImage",mem_email);
		session.close();
		return portfolio;
	}
	
	//2022-11-09-고정연/포트폴리오 삭제
		public int deletePortfolio(BigDecimal pf_num) {
			SqlSession session = sqlSessionFactory.openSession(true);
			int row = session.delete("deletePortfolio", pf_num);
			session.close();
			return row;
		}
}
