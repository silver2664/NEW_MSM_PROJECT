package com.project.board.service;

import java.util.List;

import com.project.board.vo.BoardVO;
import com.project.board.vo.SearchCriteria;

public interface BoardService {
	
	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;
	
	// 리스트 조회
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 게시물 조회
	public BoardVO read(int qid) throws Exception;
	
	// 게시물 수정
	public void update(BoardVO boardVO) throws Exception;
	
	// 게시물 삭제
	public void delete(int qid) throws Exception;
	
	//글 보기
	public BoardVO content_view(int qid) throws Exception;

}
