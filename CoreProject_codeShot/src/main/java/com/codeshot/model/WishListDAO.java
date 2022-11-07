package com.codeshot.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codeshot.db.SqlSessionManager;

public class WishListDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	//2022-11-04-김지수/회원 찜목록 검색
	public List<PostDTO> wishList(String email) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PostDTO> wishList = session.selectList("wishList", email);
		session.close();
		return wishList;
	}
}
