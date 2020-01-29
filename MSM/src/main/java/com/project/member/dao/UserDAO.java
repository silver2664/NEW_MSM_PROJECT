package com.project.member.dao;

import java.util.Map;

import com.project.member.vo.MemberVO;
import com.project.msm.util.RegisterRequest;

public interface UserDAO {
	
	// 01. email select
	public MemberVO selectByEmail(String mEmail) throws Exception;
	
	// 02. id select
	public MemberVO selectById(String mId) throws Exception;
	
	// 03. Sign Up
	public void insertUser(RegisterRequest regReq) throws Exception;
	
	// 04. Sign Up 2
	public void insertUser2(MemberVO memberVO) throws Exception;
	

	// 05. idCheck
	public int idCheck(Map<String, Object> map) throws Exception;
	
	// 06. idChek2
	public int idCheck2(String mId) throws Exception;
	
	
}
