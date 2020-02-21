package com.project.order.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.board.vo.SearchCriteria;
import com.project.order.vo.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insert(OrderVO order) {
		sqlSession.insert("orderMapper.orderInsert",order);

	}
	
	// 02. 결제내역
	@Override
	public List<OrderVO> orderList(String mId) throws Exception{
		return sqlSession.selectList("orderMapper.orderList", mId);
	}
	
	// 주문 내역 조회
	@Override
	public List<OrderVO> order(String mId) throws Exception {
		return sqlSession.selectList("orderMapper.order",mId);
	}
	
	// 03. OrderInfo (Admin)
	@Override
	public List<OrderVO> orderInfo()throws Exception{
		return sqlSession.selectList("orderMapper.orderInfo");
	}
	
	// 04. OrderInfo (Admin)
	@Override
	public List<OrderVO> orderInfo2(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("orderMapper.orderInfo", scri);
	}
		
	// 05. OrderCount (Admin)
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return sqlSession.selectOne("orderMapper.listCount", scri);
	}
	
	// 06. Update OrderState (Admin)
	@Override
	public void updateDeliveryInfo(OrderVO vo) throws Exception {
		sqlSession.update("orderMapper.updateDeliveryInfo", vo);
	}

}
