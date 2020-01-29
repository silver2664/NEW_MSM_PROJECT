package com.project.member.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.member.vo.MemberVO;
import com.project.msm.util.RegisterRequest;

@Repository("userDAO")
public class UserDAOlmpl implements UserDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public MemberVO selectByEmail(String mEmail) throws Exception {
		return sqlSession.selectOne("userMapper.selectByEmail", mEmail);
	}

	@Override
	public MemberVO selectById(String mId) throws Exception {
		return sqlSession.selectOne("userMapper.selectByID", mId);
	}

	@Override
	public void insertUser(RegisterRequest regReq) throws Exception {
		sqlSession.insert("userMapper.register", regReq);

	}
	
	@Override
	public void insertUser2(MemberVO vo) throws Exception {
		sqlSession.insert("userMapper.register", vo);
	}
	
	
	@Override
	@SuppressWarnings("unchecked")
	public int idCheck(Map<String, Object> map) throws Exception {
		System.out.println("DAO idCheck");
		Map<String, Object> resultMap = (Map<String, Object>)sqlSession.selectOne("userMapper.idCheck", map);
		int result = Integer.valueOf(String.valueOf(resultMap.get(map)));
		return result;
	}
	
	
	@Override
	public int idCheck2(String mId) throws Exception {			
		System.out.println("idCheck2 method(DAO) mId : " + mId);
		int result = sqlSession.selectOne("userMapper.idCheck2", mId);
		return result;
	}
}
