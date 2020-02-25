package com.project.order.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.board.vo.SearchCriteria;
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
	
	// �ֹ� ���� ��ȸ
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
	
	// 07. Select Total Ring Amount
	public List<OrderVO> amountRing() throws Exception {
		return sqlSession.selectList("amountRing");
	}
		
	// 08. Select Total Earring Amount
	public List<OrderVO> amountEarring() throws Exception{
		return sqlSession.selectList("amountEarring");
	}
			
	// 09. Select Total Bracelet Amount
	public List<OrderVO> amountBracelet() throws Exception {
		return sqlSession.selectList("amountBracelet");
	}
			
	// 10. Select Total Ring Amount
	public List<OrderVO> amountNecklace() throws Exception {
		return sqlSession.selectList("amountNecklace");
	}
	
	// 11. ��ǰ ���� ����
	public void changeStock(GoodsVO goods) throws Exception {
		sqlSession.update("orderMapper.changeStock",goods);
	}
	
	// 12. �� ����
	public int sumPrice() throws Exception {
		return sqlSession.selectOne("orderMapper.sumPrice");
	}
		
	// 13. �ֹ� ��
	public int counterOrder() throws Exception {
		return sqlSession.selectOne("orderMapper.counterOrder");
	}

}
