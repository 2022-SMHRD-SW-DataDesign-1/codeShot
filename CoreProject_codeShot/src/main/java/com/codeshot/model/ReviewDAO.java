package com.codeshot.model;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codeshot.db.SqlSessionManager;

public class ReviewDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 2022-11-07/김지수/게시물 별점 출력
	public List<ReviewDTO> starratingList() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<ReviewDTO> list = session.selectList("starratingList");
		session.close();
		return list;	
	}	
			
	
	// 2022-11-09/이슬비/리뷰데이터 삽입 메소드
	public int insertReview(ReviewDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("insertReview", dto);
		session.close();
		return row;
	}
	
	// 2022-11-09/이슬비/리뷰작성한게시글 출력 메소드
	public ReviewDTO showReview(ReviewDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		ReviewDTO list = session.selectOne("showReview", dto);
		session.close();
		return list;
	}
	
	// 2022-11-10/리뷰목록 리뷰 작성 유무로 분리
	public int checkReview(ReviewDTO dto) 
	{
		SqlSession session = sqlSessionFactory.openSession(true);
		int count = session.selectOne("checkReview", dto);
		session.close();
		return count;
	}
	
	// 2022-11-10/이슬비/리뷰수정
	public int updateReview(ReviewDTO dto) 
	{
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.selectOne("updateReview", dto);
		session.close();
		return row;
	}
	
	
	
	
}
