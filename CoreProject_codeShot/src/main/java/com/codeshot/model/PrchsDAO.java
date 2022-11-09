package com.codeshot.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codeshot.db.SqlSessionManager;

public class PrchsDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	//2022-11-09-이슬비/구매내역 전체 출력
	public List<PrchsDTO> prchsList(String email) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PrchsDTO> prchsList = session.selectList("prchsList", email);
		session.close();
		return prchsList;
	}
}
