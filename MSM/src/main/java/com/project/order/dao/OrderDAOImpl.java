package com.project.order.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.goods.vo.GoodsVO;
import com.project.order.vo.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insert(OrderVO order) {
		sqlSession.insert("orderMapper.orderInsert",order);

	}
	
	// 02. ��������
	@Override
	public List<OrderVO> orderList(String mId) throws Exception{
		return sqlSession.selectList("orderMapper.orderList", mId);
	}

	@Override
	public List<OrderVO> order(String mId) throws Exception {
		
		return sqlSession.selectList("orderMapper.order",mId);
	}

	@Override
	public void changeStock(GoodsVO goods) throws Exception {
		sqlSession.update("orderMapper.changeStock",goods);
		
	}

}
