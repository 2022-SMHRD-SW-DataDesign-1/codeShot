package com.codeshot.model;

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
	
	// 2022-11-09/이슬비/리뷰목록 전체 불러오기 메소드
//	public List<ReviewDTO> reviewList(String email) {
//		SqlSession session = sqlSessionFactory.openSession(true);
//		List<ReviewDTO> list = session.selectList("reviewList", email);
//		session.close();
//		return list;
//	}
	
	
	
	
	
}
