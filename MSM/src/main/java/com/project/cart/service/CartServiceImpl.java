package com.project.cart.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.cart.dao.CartDAO;
import com.project.cart.vo.CartVO;

@Service
public class CartServiceImpl implements CartService {

	@Inject
	CartDAO dao;
	
	// 01. 장바구니 추가
	public void insert(CartVO vo) {
		dao.insert(vo);
	}
			
	// 02. 장바구니 목록
	public List<CartVO> listCart(String userId){
		return dao.listCart(userId);
	}
			
	// 03. 장바구니 삭제
	public void delete(int cartId) {
		dao.delete(cartId);
	}
			
	// 04. 장바구니 수정
	public void modifyCart(CartVO vo) {
		dao.modifyCart(vo);
	}
			
	// 05. 장바구니 금액 합계
	public int sumMoney(String userId) {
		return dao.sumMoney(userId);
	}
		
	// 06. 장바구니 동일한 상품 레코드 확인
	public int countCart(int productId, String userId) {
		System.out.println("CartService countCart 메서드 실행");
		return dao.countCart(productId, userId);
	}
			
	// 07. 장바구니 상품수량 변경
	public void updateCart(CartVO vo) {
		dao.updateCart(vo);
	}
}
