package com.codeshot.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codeshot.db.SqlSessionManager;

public class PostDAO 
{
	
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	//2022-11-01-조영찬/게시글 전체 목록 불러오기
	public List<PostDTO> showPost() 
	{
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PostDTO> postList = session.selectList("showPost");
		session.close();
		return postList;
	}
	
	//2022-11-01-김지수/게시글 검색
	public List<PostDTO> searchPost(String userInput) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PostDTO> postList = session.selectList("searchPost", userInput);
		session.close();
		return postList;
	}
	
	//2022-11-03-고정연/게시물 업로드
	public int uploadPost(PostDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("uploadPost",dto);
		session.close();
		return row;
	}
}
