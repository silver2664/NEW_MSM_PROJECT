package com.project.order.dao;

import java.util.List;

import com.project.order.vo.OrderVO;

public interface OrderDAO {
	
	//�ֹ�
	public void insert(OrderVO order);
	
	// 02. ��������
	public List<OrderVO> orderList(String mId) throws Exception;
	
}
