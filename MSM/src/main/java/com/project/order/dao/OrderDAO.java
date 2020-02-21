package com.project.order.dao;

import java.util.List;

import com.project.order.vo.OrderVO;

public interface OrderDAO {
	
	//주문
	public void insert(OrderVO order);
	
	// 02. 결제내역
	public List<OrderVO> orderList(String mId) throws Exception;
	
	//주문 내역 조회
	public List<OrderVO> order(String mId) throws Exception;
	
}
