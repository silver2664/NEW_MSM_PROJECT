package com.project.order.dao;

import java.util.List;

import com.project.goods.vo.GoodsVO;
import com.project.order.vo.OrderVO;

public interface OrderDAO {
	
	//�ֹ�
	public void insert(OrderVO order);
	
	// 02. ��������
	public List<OrderVO> orderList(String mId) throws Exception;
	
	//�ֹ� ���� ��ȸ
	public List<OrderVO> order(String mId) throws Exception;
	
	//상품 수량 조절
	public void changeStock(GoodsVO goods) throws Exception;
}
