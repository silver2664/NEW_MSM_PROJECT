package com.project.member.service;

import java.util.List;
import java.util.Map;

import com.project.board.vo.SearchCriteria;
import com.project.member.vo.MemberDTO;
import com.project.member.vo.MemberVO;
import com.project.msm.util.RegisterRequest;

public interface UserService {	
	
	
	public void insertUser(RegisterRequest regReq) throws Exception;
	
	public void insertUser2(MemberVO memberVO) throws Exception;
	
	public int idCheck(Map<String, Object> map) throws Exception;
	
	public int idCheck2(String mId) throws Exception;
	
	// 5. Email 인증
	
	public boolean send(String subject, String text, String from, String to, String filePath);
	
	// 6. 전체 회원 조회
	public List<MemberVO> getMemberList(SearchCriteria scri) throws Exception;
	
	// 7. 총 회원 수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 8. 회원 상세 보기
	public MemberVO memberDetail(String mId) throws Exception;
	
	// 9, 회원정보 수정
	public void update(MemberVO memberVO) throws Exception;
}
