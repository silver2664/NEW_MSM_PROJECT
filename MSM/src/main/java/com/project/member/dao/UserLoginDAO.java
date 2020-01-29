package com.project.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.member.vo.MemberVO;

@Repository("userAuthDAO")
public class UserLoginDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public MemberVO getUserById(String mId) {
		System.out.println("UserLoginDAO mId : " + mId);
		return sqlSession.selectOne("userMapper.selectUserById", mId);
	}
	

}
