package com.project.board.dao;

import java.util.List;

import com.project.board.vo.BoardVO;
import com.project.board.vo.SearchCriteria;

public interface BoardDAO {

		//�Խù� �ۼ�
		public void write(BoardVO boardVO) throws Exception;
		
		//�Խù� ��ȸ
		public List<BoardVO> list(SearchCriteria scri) throws Exception;
		
		//�Խù� ����
		public int listCount(SearchCriteria scri) throws Exception;
		
		//�Խù� �󼼺���
		public BoardVO content_view(int qid) throws Exception;
		
		// �Խù� ����
		public void update(BoardVO boardVO) throws Exception;
		
		// �Խù� ����
		public void delete(int qid) throws Exception;
		
		//QNA�Խ��� ��ȸ��
		public void qnaHit(int qid) throws Exception;
		
}
