package com.project.board.dao;

import java.util.List;

import com.project.board.vo.ReplyVO;

public interface ReplyDAO {
	
	// ´ñ±Û Á¶È¸
	public List<ReplyVO> readReply(int qid) throws Exception;
	
	// ´ñ±Û ÀÛ¼º
	public void writeReply(ReplyVO vo) throws Exception;
	
	// ´ñ±Û ¼öÁ¤
	public void updateReply(ReplyVO vo) throws Exception;
	
	// ´ñ±Û »èÁ¦
	public void deleteReply(ReplyVO vo) throws Exception;
	
	// ¼±ÅÃ ´ñ±Û Á¶È¸
	public ReplyVO selectReply(int qid) throws Exception;
}
