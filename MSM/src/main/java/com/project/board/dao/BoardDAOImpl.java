package com.project.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.board.vo.BoardVO;
import com.project.board.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	//�Խù� �ۼ�
	@Override
	public void write(BoardVO boardVO) throws Exception {		
		sqlSession.insert("boardMapper.insert",boardVO);
	}
	
	//�Խù� ����Ʈ
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {		
		return sqlSession.selectList("boardMapper.listPage",scri);
	}
	
	//�Խù� ����
	@Override
	public BoardVO content_view(int qid) throws Exception {		
		return sqlSession.selectOne("boardMapper.content_view",qid);
	}

		// �Խù� ����
		@Override
		public void update(BoardVO boardVO) throws Exception {			
			sqlSession.update("boardMapper.update", boardVO);
		}

		// �Խù� ����
		@Override
		public void delete(int qid) throws Exception {			
			sqlSession.delete("boardMapper.delete", qid);
		}

		
		//�Խù� �� ����
		@Override
		public int listCount(SearchCriteria scri) throws Exception {
			
			return sqlSession.selectOne("boardMapper.listCount",scri);
		}
		
		//�Խ��� ��ȸ��
		@Override
		public void qnaHit(int qid) throws Exception {
			sqlSession.update("boardMapper.qnaHit",qid);
			
		}

		
		
		


}
