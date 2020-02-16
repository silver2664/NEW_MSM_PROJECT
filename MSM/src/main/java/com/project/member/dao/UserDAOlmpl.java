package com.project.member.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.board.vo.SearchCriteria;
import com.project.member.vo.MemberVO;
import com.project.msm.util.RegisterRequest;

@Repository("userDAO")
public class UserDAOlmpl implements UserDAO {
	
	@Inject
	SqlSession sqlSession;
	
	// ���� �̸��� ����.
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
	
	
	/*
	@Override
	@SuppressWarnings("unchecked")
	public int idCheck(Map<String, Object> map) throws Exception {
		System.out.println("DAO idCheck");
		Map<String, Object> resultMap = (Map<String, Object>)sqlSession.selectOne("userMapper.idCheck", map);
		int result = Integer.valueOf(String.valueOf(resultMap.get(map)));
		return result;
	}
	*/
	
	@Override
	public int idCheck2(String mId) throws Exception {			
		System.out.println("idCheck2 method(DAO) mId : " + mId);
		int result = sqlSession.selectOne("userMapper.idCheck2", mId);
		return result;
	}
	
	//07. MEMBER ���̺� ��� ȸ�� ��ȸ
	public List<MemberVO> getMemberList(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("userMapper.selectAll", scri);
	}
		
	//08. �Խù� ����
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("userMapper.listCount", scri);
	}
	
	//09. ȸ�� �� ����
	public MemberVO memberDetail(String mId) throws Exception {
		return sqlSession.selectOne("userMapper.selectUserById", mId);
	}
	
	//10. ȸ����������
	public void update(MemberVO memberVO) throws Exception{
		sqlSession.update("userMapper.update", memberVO);
	}
	//11. ȸ������ ����
	public void updateAuth(MemberVO vo) throws Exception{
		
		sqlSession.update("userMapper.updateAuth", vo);
		/*
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String mId = map.get("mId").toString();
		String authority = map.get("authority").toString();
		resultMap.put("mId", mId);
		resultMap.put("authority", authority);
		System.out.println("���Ѻ���DAO : " + resultMap);
		sqlSession.update("userMapper.updateAuth", resultMap);
		*/
		/*
		System.out.println("updateAuth DAO : " + vo.getAuthority() + " " + vo.getmId());
		sqlSession.update("userMapper.updateAuth", vo);
		*/
	}
	
	//12. ȸ����й�ȣ ����
	public void updatePw(MemberVO memberVO) throws Exception{
		sqlSession.update("userMapper.updatePw", memberVO);
	}
	
	//13. ȸ��Email üũ
	public String emailCheck(String mId) throws Exception {
		return sqlSession.selectOne("checkEmail", mId);
	}
	
	//14. ���̵�, ���� select
	public List<HashMap<String, Object>> selectIdAuth() throws Exception {
		return sqlSession.selectList("userMapper.selectIdAuth");
	}
	
	//15. member Ż��
	public void delete(String mId) throws Exception {
		sqlSession.delete("userMapper.delete", mId);
	}
}
