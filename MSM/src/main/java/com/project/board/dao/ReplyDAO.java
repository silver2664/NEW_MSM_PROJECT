package com.project.board.dao;

import java.util.List;

import com.project.board.vo.ReplyVO;

public interface ReplyDAO {
	
	// ��� ��ȸ
	public List<ReplyVO> readReply(int qid) throws Exception;
	
	// ��� �ۼ�
	public void writeReply(ReplyVO vo) throws Exception;
	
	// ��� ����
	public void updateReply(ReplyVO vo) throws Exception;
	
	// ��� ����
	public void deleteReply(ReplyVO vo) throws Exception;
	
	// ���� ��� ��ȸ
	public ReplyVO selectReply(int qid) throws Exception;
}
