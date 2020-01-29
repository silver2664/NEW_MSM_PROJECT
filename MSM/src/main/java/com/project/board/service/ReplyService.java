package com.project.board.service;

import java.util.List;

import com.project.board.vo.ReplyVO;

public interface ReplyService {
	
	// ��� ����
	public List<ReplyVO> readReply (int bno) throws Exception;
	
	// ��� �ۼ�
	public void writeReply(ReplyVO vo) throws Exception;
	
	// ��� ����
	public void updateReply(ReplyVO vo) throws Exception;
	
	// ��� ����
	public void deleteReply(ReplyVO vo) throws Exception;
	
	// ���ô����ȸ
	public ReplyVO selectReply(int rno) throws Exception;
}
