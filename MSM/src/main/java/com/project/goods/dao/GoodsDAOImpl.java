package com.project.goods.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.goods.vo.GoodsVO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<GoodsVO> listProduct() throws Exception {
		return sqlSession.selectList("goodsMapper.listProduct");
	}

	@Override
	public GoodsVO detailProduct(int mgNum) {
		return sqlSession.selectOne("goodsMapper.detailProduct", mgNum);
	}

	@Override
	public void updateProduct(GoodsVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteProduct(int mgNum) {
		// TODO Auto-generated method stub

	}

}
