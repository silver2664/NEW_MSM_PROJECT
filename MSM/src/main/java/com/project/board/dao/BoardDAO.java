package com.project.board.dao;

import java.util.List;

import com.project.board.vo.BoardVO;
import com.project.board.vo.SearchCriteria;

public interface BoardDAO {

		//게시물 작성
		public void write(BoardVO boardVO) throws Exception;
		
		//게시물 조회
		public List<BoardVO> list(SearchCriteria scri) throws Exception;
		
		//게시물 갯수
		public int listCount(SearchCriteria scri) throws Exception;
		
		//게시물 상세보기
		public BoardVO content_view(int qid) throws Exception;
		
		// 게시물 수정
		public void update(BoardVO boardVO) throws Exception;
		
		// 게시물 삭제
		public void delete(int qid) throws Exception;
		
		//QNA게시판 조회수
		public void qnaHit(int qid) throws Exception;
		
}
