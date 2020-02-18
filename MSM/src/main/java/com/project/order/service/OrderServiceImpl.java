package com.project.order.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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

}
