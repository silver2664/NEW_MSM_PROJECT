package com.project.member.dao;

import java.util.HashMap;
import java.util.List;

import com.project.board.vo.SearchCriteria;
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
	//public int idCheck(Map<String, Object> map) throws Exception;
	
	// 06. idChek2
	public int idCheck2(String mId) throws Exception;
	
	//07. MEMBER 테이블 모든 회원 조회
	public List<MemberVO> getMemberList(SearchCriteria scri) throws Exception;
	
	//08. 게시물 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	//09. 회원 상세 정보
	public MemberVO memberDetail(String mId) throws Exception;
	
	//10. 회원정보 수정
	public void update(MemberVO memberVO) throws Exception;
	
	//11. 회원권한 변경
	public void updateAuth(MemberVO vo) throws Exception;
	
	//12. 회원비밀번호 변경
	public void updatePw(MemberVO memberVO) throws Exception;
	
	//13. 회원Email 체크
	public String emailCheck(String mId) throws Exception;
	
	//14. 아이디, 권한 select
	public List<HashMap<String, Object>> selectIdAuth() throws Exception;
	
	//15. member 탈퇴
	public void delete(String mId) throws Exception;
	
}
