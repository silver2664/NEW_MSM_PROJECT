package com.project.cart.dao;

import java.util.List;

import com.project.cart.vo.CartVO;
import com.project.member.vo.MemberVO;


public interface CartDAO {
	
	// 01. ��ٱ��� �߰�
	public void insert(CartVO vo);
	
	// 02. ��ٱ��� ���
	public List<CartVO> listCart(String userId);
	
	// 03. ��ٱ��� ����
	public void delete(int cartId);
	
	// 04. ��ٱ��� ����
	public void modifyCart(CartVO vo);
	
	// 05. ��ٱ��� �ݾ� �հ�
	public int sumMoney(String userId);
	
	// 06. ��ٱ��� ������ ��ǰ ���ڵ� Ȯ��
	public int countCart(int mgNum, String userId);
	
	// 07. ��ٱ��� ��ǰ���� ����
	public void updateCart(CartVO vo);
	
	//ȸ�� ���� ��������
	public MemberVO member(String userId);

}
