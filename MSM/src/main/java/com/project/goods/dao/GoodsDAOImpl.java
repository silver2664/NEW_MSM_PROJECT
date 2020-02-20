package com.project.goods.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.board.vo.SearchCriteria;
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
	
	//ī�װ� ����Ʈ
	@Override
	public List<GoodsViewVO> catelist(int cateCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goodsMapper.cateList",cateCode);
	}
	
	// ��� ��ǰ ��ȸ
	@Override
	public List<GoodsViewVO> getGoodsList(SearchCriteria scri) throws Exception{
		return sqlSession.selectList("goodsMapper.allGoods", scri);
	}
	
	// �Խù� ����
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return sqlSession.selectOne("goodsMapper.listCount", scri);
	}
	
	// Admin Page ��� ����
	@Override
	public void updateAmount(GoodsViewVO vo) throws Exception {
		sqlSession.update("goodsMapper.updateAmount", vo);
	}
		
	// Admin Page ���� ����
	@Override
	public void updatePrice(GoodsViewVO vo) throws Exception {
		sqlSession.update("goodsMapper.updatePrice", vo);
	}
	
	// Ring ����Ʈ
	@Override
	public List<GoodsViewVO> ringList() throws Exception {
		return sqlSession.selectList("goodsMapper.ringList");
	}

	// Earring ����Ʈ
	@Override
	public List<GoodsViewVO> earringList() throws Exception {
		return sqlSession.selectList("goodsMapper.earringList");
	}
		
	// Bracelet ����Ʈ
	@Override
	public List<GoodsViewVO> braceletList() throws Exception {
		return sqlSession.selectList("goodsMapper.braceletList");
	}
			
	// necklace ����Ʈ
	@Override
	public List<GoodsViewVO> necklaceList() throws Exception {
		return sqlSession.selectList("goodsMapper.necklaceList");
	}
	
	// BRAND AAS ����Ʈ
	public List<GoodsViewVO> aasList() throws Exception {
		return sqlSession.selectList("goodsMapper.aasList");
	}
		
	// BRAND BBS ����Ʈ
	public List<GoodsViewVO> bbsList() throws Exception {
		return sqlSession.selectList("goodsMapper.bbsList");
	}


}
