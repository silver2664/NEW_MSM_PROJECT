package com.project.member.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.board.vo.SearchCriteria;
import com.project.member.vo.MemberDTO;
import com.project.member.vo.MemberVO;
import com.project.msm.util.RegisterRequest;

@Repository("userDAO")
public class UserDAOlmpl implements UserDAO {
	
	@Inject
	SqlSession sqlSession;
	
	// 유저 이메일 셀렉.
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
	
	//07. MEMBER 테이블 모든 회원 조회
	public List<MemberVO> getMemberList(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("userMapper.selectAll", scri);
	}
		
	//08. 게시물 갯수
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("userMapper.listCount", scri);
	}
	
	//09. 회원 상세 정보
	public MemberVO memberDetail(String mId) throws Exception {
		return sqlSession.selectOne("userMapper.selectUserById", mId);
	}
	
	//10. 회원정보수정
	public void update(MemberVO memberVO) throws Exception{
		sqlSession.update("userMapper.update", memberVO);
	}
	//11. 회원권한 변경
	public void updateAuth(MemberVO memberVO) throws Exception{
		sqlSession.update("userMapper.updateAuth", memberVO);
	}
	
	//12. 회원비밀번호 변경
	public void updatePw(MemberVO memberVO) throws Exception{
		sqlSession.update("userMapper.updatePw", memberVO);
	}
	
	//13. 회원Email 체크
	public String emailCheck(String mId) throws Exception {
		return sqlSession.selectOne("checkEmail", mId);
	}
}
