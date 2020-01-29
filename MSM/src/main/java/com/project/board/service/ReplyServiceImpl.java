package com.project.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.board.dao.ReplyDAO;
import com.project.board.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	
	@Inject
	ReplyDAO dao;
	
	// ´ñ±Û º¸±â
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		
		return dao.readReply(bno);
	}
	
	// ´ñ±Û ÀÛ¼º
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		
		dao.writeReply(vo);
	}
	
	// ´ñ±Û ¼öÁ¤
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		dao.updateReply(vo);
	}
	
	// ´ñ±Û »èÁ¦
	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		dao.deleteReply(vo);
	}
	
	// ¼±ÅÃ ´ñ±Û Á¶È¸
	@Override
	public ReplyVO selectReply(int rno) throws Exception {
		return dao.selectReply(rno);
	}

}
