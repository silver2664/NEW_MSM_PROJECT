package com.project.order.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.board.vo.SearchCriteria;
import com.project.order.dao.OrderDAO;
import com.project.order.service.OrderService;
import com.project.order.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	OrderDAO dao;

	@Override
	public void insert(OrderVO order) {
		dao.insert(order);
		

	}
	
	// 02. 결제내역
	@Override
	public List<OrderVO> orderList(String mId) throws Exception{
		return dao.orderList(mId);
	}
	
	// 주문 내역 조회
	@Override
	public List<OrderVO> order(String mId) throws Exception {
		return dao.order(mId);
	}
	
	// 03. OrderInfo (Admin)
	@Override
	public List<OrderVO> orderInfo()throws Exception {
		return dao.orderInfo();
	}
	
	// 04. OrderInfo (Admin)
	@Override
	public List<OrderVO> orderInfo2(SearchCriteria scri) throws Exception {
		return dao.orderInfo2(scri);
	}
		
	// 05. OrderCount (Admin)
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}
	
	// 06. Update OrderState (Admin)
	@Override
	public void updateDeliveryInfo(OrderVO vo) throws Exception {
		dao.updateDeliveryInfo(vo);
	}

}
