package com.project.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.board.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	
	@Inject
	SqlSession sql;
	
	// ��� ����
	@Override
	public List<ReplyVO> readReply(int qid) throws Exception {
		
		return sql.selectList("replyMapper.readReply", qid);
	}
	
	// ��� �ۼ�
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		sql.insert("replyMapper.writeReply", vo);
	}
	
	// ��� ����
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		sql.update("replyMapper.updateReply", vo);
	}
	
	// ��� ����
	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		sql.delete("replyMapper.deleteReply", vo);
	}
	
	// ���� ��� ��ȸ
	public ReplyVO selectReply(int qid) throws Exception {
		return sql.selectOne("replyMapper.sectReply", qid);
	}

}
