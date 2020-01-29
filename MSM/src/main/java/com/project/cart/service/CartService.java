package com.project.cart.service;

import java.util.List;

import com.project.cart.vo.CartVO;

public interface CartService {
	
	// 01. 장바구니 추가
	public void insert(CartVO vo);
		
	// 02. 장바구니 목록
	public List<CartVO> listCart(String userId);
		
	// 03. 장바구니 삭제
	public void delete(int cartId);
		
	// 04. 장바구니 수정
	public void modifyCart(CartVO vo);
		
	// 05. 장바구니 금액 합계
	public int sumMoney(String userId);
	
	// 06. 장바구니 동일한 상품 레코드 확인
	public int countCart(int productId, String userId);
		
	// 07. 장바구니 상품수량 변경
	public void updateCart(CartVO vo);
}
