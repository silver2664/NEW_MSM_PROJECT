package com.project.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.member.vo.MemberAuthorityDTO;
import com.project.member.vo.MemberDTO;
import com.project.member.vo.MemberVO;

@Repository("userAuthDAO")
public class UserLoginDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public MemberVO getUserById(String mId) {
		System.out.println("UserLoginDAO mId : " + mId);
		return sqlSession.selectOne("userMapper.selectUserById", mId);
	}
	
	public List<MemberAuthorityDTO> getUserAuthority(String mId, String authority){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mId", mId);
		map.put("authority", authority);		
		List<MemberAuthorityDTO> memberAuthority = new ArrayList<MemberAuthorityDTO>(sqlSession.selectList("userMapper.authorityList", map));
		System.out.println("UserLoginDAO Ã³¸® : " + memberAuthority);
		return memberAuthority;
	}
	

}
