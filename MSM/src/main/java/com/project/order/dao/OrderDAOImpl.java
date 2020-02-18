package com.project.order.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.order.vo.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insert(OrderVO order) {
		sqlSession.insert("orderMapper.orderInsert",order);

	}

}
