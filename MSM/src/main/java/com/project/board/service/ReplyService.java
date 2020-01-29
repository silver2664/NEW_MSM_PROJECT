package com.project.board.service;

import java.util.List;

import com.project.board.vo.ReplyVO;

public interface ReplyService {
	
	// ´ñ±Û º¸±â
	public List<ReplyVO> readReply (int bno) throws Exception;
	
	// ´ñ±Û ÀÛ¼º
	public void writeReply(ReplyVO vo) throws Exception;
	
	// ´ñ±Û ¼öÁ¤
	public void updateReply(ReplyVO vo) throws Exception;
	
	// ´ñ±Û »èÁ¦
	public void deleteReply(ReplyVO vo) throws Exception;
	
	// ¼±ÅÃ´ñ±ÛÁ¶È¸
	public ReplyVO selectReply(int rno) throws Exception;
}
