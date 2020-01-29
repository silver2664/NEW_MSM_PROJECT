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
	
	//게시물 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {		
		sqlSession.insert("boardMapper.insert",boardVO);
	}
	
	//게시물 리스트
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {		
		return sqlSession.selectList("boardMapper.listPage",scri);
	}
	
	//게시물 보기
	@Override
	public BoardVO content_view(int qid) throws Exception {		
		return sqlSession.selectOne("boardMapper.content_view",qid);
	}

		// 게시물 수정
		@Override
		public void update(BoardVO boardVO) throws Exception {			
			sqlSession.update("boardMapper.update", boardVO);
		}

		// 게시물 삭제
		@Override
		public void delete(int qid) throws Exception {			
			sqlSession.delete("boardMapper.delete", qid);
		}

		
		//게시물 총 갯수
		@Override
		public int listCount(SearchCriteria scri) throws Exception {
			
			return sqlSession.selectOne("boardMapper.listCount",scri);
		}
		
		//게시판 조회수
		@Override
		public void qnaHit(int qid) throws Exception {
			sqlSession.update("boardMapper.qnaHit",qid);
			
		}

		
		
		


}
