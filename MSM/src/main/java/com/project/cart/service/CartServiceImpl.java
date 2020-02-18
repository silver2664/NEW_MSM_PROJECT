package com.project.cart.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.cart.dao.CartDAO;
import com.project.cart.vo.CartVO;
import com.project.member.vo.MemberVO;

@Service
public class CartServiceImpl implements CartService {

	@Inject
	CartDAO dao;
	
	// 01. ��ٱ��� �߰�
	public void insert(CartVO vo) {
		dao.insert(vo);
	}
			
	// 02. ��ٱ��� ���
	public List<CartVO> listCart(String userId){
		return dao.listCart(userId);
	}
			
	// 03. ��ٱ��� ����
	public void delete(int cartId) {
		dao.delete(cartId);
	}
			
	// 04. ��ٱ��� ����
	public void modifyCart(CartVO vo) {
		dao.modifyCart(vo);
	}
			
	// 05. ��ٱ��� �ݾ� �հ�
	public int sumMoney(String userId) {
		return dao.sumMoney(userId);
	}
		
	// 06. ��ٱ��� ������ ��ǰ ���ڵ� Ȯ��
	public int countCart(int mgNum, String userId) {
		System.out.println("CartService countCart �޼��� ����");
		return dao.countCart(mgNum, userId);
	}
			
	// 07. ��ٱ��� ��ǰ���� ����
	public void updateCart(CartVO vo) {
		dao.updateCart(vo);
	}
	
	public MemberVO member(String userId) {
		// TODO Auto-generated method stub
		return dao.member(userId);
	}

}
