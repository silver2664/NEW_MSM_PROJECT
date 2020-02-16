package com.project.member.service;

import java.util.HashMap;
import java.util.List;

import com.project.board.vo.SearchCriteria;
import com.project.member.vo.MemberVO;
import com.project.msm.util.RegisterRequest;

public interface UserService {	
	
	
	public void insertUser(RegisterRequest regReq) throws Exception;
	
	public void insertUser2(MemberVO memberVO) throws Exception;
	
	//public int idCheck(Map<String, Object> map) throws Exception;
	
	public int idCheck2(String mId) throws Exception;
	
	// 5. Email ����	
	public boolean send(String subject, String text, String from, String to, String filePath);
	
	// 6. ��ü ȸ�� ��ȸ
	public List<MemberVO> getMemberList(SearchCriteria scri) throws Exception;
	
	// 7. �� ȸ�� ��
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 8. ȸ�� �� ����
	public MemberVO memberDetail(String mId) throws Exception;
	
	// 9, ȸ������ ����
	public void update(MemberVO memberVO) throws Exception;
	
	//10. ȸ������ ����
	public void updateAuth(MemberVO vo) throws Exception;
	
	//11. ȸ����й�ȣ ����
	public void updatePw(MemberVO memberVO) throws Exception;
	
	//12. ���� �̸��� ����.
	public String checkEmail(String mId) throws Exception;
	
	//13. ���̵�, ���� select
	public List<HashMap<String, Object>> selectIdAuth() throws Exception;
	
	//14. member Ż��
	public void delete(String mId) throws Exception;
	
}
