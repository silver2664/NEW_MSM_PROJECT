package com.project.order.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.goods.vo.GoodsVO;
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
	
	// 02. ��������
	@Override
	public List<OrderVO> orderList(String mId) throws Exception{
		return dao.orderList(mId);
	}

	@Override
	public List<OrderVO> order(String mId) throws Exception {
	
		return dao.order(mId);
	}

	@Override
	public void changStock(GoodsVO goods) throws Exception {
		dao.changeStock(goods);
		
	}

}
