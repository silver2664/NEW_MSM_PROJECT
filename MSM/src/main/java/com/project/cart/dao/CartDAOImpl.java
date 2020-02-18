package com.project.cart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.cart.vo.CartVO;
import com.project.member.vo.MemberVO;

@Repository
public class CartDAOImpl implements CartDAO {
	
	@Inject
	SqlSession sqlSession;
	
	
	// 01. ��ٱ��� �߰�
	@Override
	public void insert(CartVO vo) {
		sqlSession.insert("cartMapper.insertCart", vo);
	}
		
	// 02. ��ٱ��� ���
	@Override
	public List<CartVO> listCart(String userId) {
		return sqlSession.selectList("cartMapper.listCart", userId);
	}
		
	// 03. ��ٱ��� ����
	@Override
	public void delete(int cartId) {
		sqlSession.delete("cartMapper.deleteCart", cartId);
	}
	
	// 04. ��ٱ��� ����
	@Override
	public void modifyCart(CartVO vo) {
		sqlSession.update("cartMapper.modifyCart", vo);
	}
		
	// 05. ��ٱ��� �ݾ� �հ�
	@Override
	public int sumMoney(String userId) {
		return sqlSession.selectOne("cartMapper.sumMoney", userId);
	}
		
	// 06. ��ٱ��� ������ ��ǰ ���ڵ� Ȯ��
	@Override
	public int countCart(int mgNum, String userId) {
		System.out.println("CartDAO COUNTCART �޼��� ����");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mgNum", mgNum);
		map.put("userId", userId);
		int result = sqlSession.selectOne("cartMapper.countCart", map);
		System.out.println("DAO-MAPPER ó�� �� RESULT �� : " + result);
		return result;
	}
		
	// 07. ��ٱ��� ��ǰ���� ����
	@Override
	public void updateCart(CartVO vo) {
		sqlSession.update("cartMapper.updateCart", vo);
	}
	
	//ȸ�� ���� ��������
	public MemberVO member(String userId) {
		return sqlSession.selectOne("cartMapper.member", userId);
	}
		
}
