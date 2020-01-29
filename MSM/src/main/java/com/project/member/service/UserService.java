package com.project.member.service;

import java.util.Map;

import com.project.member.vo.MemberVO;
import com.project.msm.util.RegisterRequest;

public interface UserService {	
	
	
	public void insertUser(RegisterRequest regReq) throws Exception;
	
	public void insertUser2(MemberVO memberVO) throws Exception;
	
	public int idCheck(Map<String, Object> map) throws Exception;
	
	public int idCheck2(String mId) throws Exception;
	
	// 5. Email ¿Œ¡ı
	
	public boolean send(String subject, String text, String from, String to, String filePath);
}
