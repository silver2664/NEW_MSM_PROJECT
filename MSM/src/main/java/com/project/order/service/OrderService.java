package com.project.order.service;

import java.util.List;

import com.project.order.vo.OrderVO;

public interface OrderService {
	
	//�ֹ�
	public void insert(OrderVO order);
	
	// 02. ��������
	public List<OrderVO> orderList(String mId) throws Exception;
}
