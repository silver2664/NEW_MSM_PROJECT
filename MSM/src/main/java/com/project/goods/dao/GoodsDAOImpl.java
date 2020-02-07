package com.project.goods.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.goods.vo.CategoryVO;
import com.project.goods.vo.GoodsVO;
import com.project.goods.vo.GoodsViewVO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<GoodsVO> listProduct() throws Exception {
		return sqlSession.selectList("goodsMapper.listProduct");
	}

	@Override
	public GoodsViewVO detailProduct(int mgNum) {
		return sqlSession.selectOne("goodsMapper.goodsView", mgNum);
	}

	@Override
	public void productModify(GoodsVO vo) throws Exception {
		System.out.println("productModify");
		
		sqlSession.update("goodsMapper.productModify",vo);
	}

	@Override
	public void productDelete(int mgNum) {
		
		sqlSession.delete("goodsMapper.productDelete",mgNum);

	}

	@Override
	public void register(GoodsVO vo) throws Exception {
		sqlSession.insert("goodsMapper.register",vo);
		
	}

	@Override
	public List<CategoryVO> category() throws Exception {
		return sqlSession.selectList("goodsMapper.category");
	}

}
