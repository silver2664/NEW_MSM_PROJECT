package com.project.board.service;

import java.util.List;

import com.project.board.vo.BoardVO;
import com.project.board.vo.SearchCriteria;

public interface BoardService {
	
	// �Խñ� �ۼ�
	public void write(BoardVO boardVO) throws Exception;
	
	// ����Ʈ ��ȸ
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	// �Խù� �� ����
	public int listCount(SearchCriteria scri) throws Exception;
	
	// �Խù� ��ȸ
	public BoardVO read(int qid) throws Exception;
	
	// �Խù� ����
	public void update(BoardVO boardVO) throws Exception;
	
	// �Խù� ����
	public void delete(int qid) throws Exception;
	
	//�� ����
	public BoardVO content_view(int qid) throws Exception;

}
