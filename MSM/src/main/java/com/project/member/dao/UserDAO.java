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
	
	//07. MEMBER ���̺� ��� ȸ�� ��ȸ
	public List<MemberVO> getMemberList(SearchCriteria scri) throws Exception;
	
	//08. �Խù� ����
	public int listCount(SearchCriteria scri) throws Exception;
	
	//09. ȸ�� �� ����
	public MemberVO memberDetail(String mId) throws Exception;
	
	//10. ȸ������ ����
	public void update(MemberVO memberVO) throws Exception;
	
	//11. ȸ������ ����
	public void updateAuth(MemberVO vo) throws Exception;
	
	//12. ȸ����й�ȣ ����
	public void updatePw(MemberVO memberVO) throws Exception;
	
	//13. ȸ��Email üũ
	public String emailCheck(String mId) throws Exception;
	
	//14. ���̵�, ���� select
	public List<HashMap<String, Object>> selectIdAuth() throws Exception;
	
	//15. member Ż��
	public void delete(String mId) throws Exception;
	
}
