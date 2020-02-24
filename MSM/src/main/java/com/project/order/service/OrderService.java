package com.project.order.service;

import java.util.List;

import com.project.board.vo.SearchCriteria;
import com.project.goods.vo.GoodsVO;
import com.project.order.vo.OrderVO;

public interface OrderService {
	
	//주문
	public void insert(OrderVO order);
	
	// 02. 결제내역
	public List<OrderVO> orderList(String mId) throws Exception;
	
	// 주문 내역 조회
	public List<OrderVO> order(String mId) throws Exception;
	
	// 03. OrderInfo (Admin)
	public List<OrderVO> orderInfo()throws Exception;
	
	// 04. OrderInfo (Admin)
	public List<OrderVO> orderInfo2(SearchCriteria scri) throws Exception;
		
	// 05. OrderCount (Admin)
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 06. Update OrderState (Admin)
	public void updateDeliveryInfo(OrderVO vo) throws Exception;
	
	// 07. Select Total Ring Amount
	public List<OrderVO> amountRing() throws Exception;
		
	// 08. Select Total Earring Amount
	public List<OrderVO> amountEarring() throws Exception;
			
	// 09. Select Total Bracelet Amount
	public List<OrderVO> amountBracelet() throws Exception;
			
	// 10. Select Total Ring Amount
	public List<OrderVO> amountNecklace() throws Exception;
	
	// 11. 상품 수량 조절
	public void changeStock(GoodsVO goods) throws Exception;
}
