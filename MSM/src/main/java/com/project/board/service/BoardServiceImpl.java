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
	
	//�� ����
	@Override
	public void write(BoardVO boardVO) throws Exception {
		
		dao.write(boardVO);
	}
	
	//�� ���
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		
		return dao.list(scri);
	}
	
	//��ȸ��
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return dao.listCount(scri);
	}
	
	//�� �󼼺���
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO content_view(int qid) throws Exception {
			dao.qnaHit(qid);		
		return dao.content_view(qid);
	}
	
	//�� ����
	@Override
	public void update(BoardVO boardVO) throws Exception {
		dao.update(boardVO);
	}
	
	//�� ����
	
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