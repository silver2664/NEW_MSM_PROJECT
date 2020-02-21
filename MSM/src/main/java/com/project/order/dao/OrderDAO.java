package com.project.order.dao;

import java.util.List;

import com.project.board.vo.SearchCriteria;
import com.project.order.vo.OrderVO;

public interface OrderDAO {
	
	//�ֹ�
	public void insert(OrderVO order);
	
	// 02. ��������
	public List<OrderVO> orderList(String mId) throws Exception;
	
	// �ֹ� ���� ��ȸ
	public List<OrderVO> order(String mId) throws Exception;
	
	// 03. OrderInfo (Admin)
	public List<OrderVO> orderInfo()throws Exception;
	
	// 04. OrderInfo (Admin)
	public List<OrderVO> orderInfo2(SearchCriteria scri) throws Exception;
	
	// 05. OrderCount (Admin)
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 06. Update OrderState (Admin)
	public void updateDeliveryInfo(OrderVO vo) throws Exception;
	
}
