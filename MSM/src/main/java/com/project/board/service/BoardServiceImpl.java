package com.project.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.project.board.dao.BoardDAO;
import com.project.board.vo.BoardVO;
import com.project.board.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;
	
	//글 쓰기
	@Override
	public void write(BoardVO boardVO) throws Exception {
		
		dao.write(boardVO);
	}
	
	//글 목록
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		
		return dao.list(scri);
	}
	
	//조회수
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return dao.listCount(scri);
	}
	
	//글 상세보기
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO content_view(int qid) throws Exception {
			dao.qnaHit(qid);		
		return dao.content_view(qid);
	}
	
	//글 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {
		dao.update(boardVO);
	}
	
	//글 삭제
	
	@Override
	public void delete(int qid) throws Exception {		
		dao.delete(qid);
	}

	@Override
	public BoardVO read(int qid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}