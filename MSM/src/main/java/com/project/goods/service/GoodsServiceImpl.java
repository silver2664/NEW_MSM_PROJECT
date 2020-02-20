package com.project.goods.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.board.vo.SearchCriteria;
import com.project.goods.dao.GoodsDAO;
import com.project.goods.vo.CategoryVO;
import com.project.goods.vo.GoodsVO;
import com.project.goods.vo.GoodsViewVO;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	
	@Inject
	GoodsDAO dao;
	
	//��ǰ���
	@Override
	public List<GoodsVO> listProduct() throws Exception {
		return dao.listProduct();
	}
	//��ǰ �󼼺���
	@Override
	public GoodsViewVO detailProduct(int mgNum) {
		return dao.detailProduct(mgNum);
	}
	//��ǰ����
	@Override
	public void productModify(GoodsVO vo) throws Exception {
		dao.productModify(vo);

	}
	//��ǰ����
	@Override
	public void productDelete(int mgNum) {
		dao.productDelete(mgNum);

	}
	//��ǰ���
	@Override
	public void register(GoodsVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.register(vo);		
	}
	//ī�װ� ��ȸ
	@Override
	public List<CategoryVO> category() throws Exception {
		// TODO Auto-generated method stub
		return dao.category();
	}
	//ī�װ��� ����Ʈ
	@Override
	public List<GoodsViewVO> catelist(int cateCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.catelist(cateCode);
	}
	
	// ��� ��ǰ ��ȸ
	public List<GoodsViewVO> getGoodsList(SearchCriteria scri) throws Exception{
		return dao.getGoodsList(scri);
	}
			
	// �Խù� ����
	public int listCount(SearchCriteria scri) throws Exception{
		return dao.listCount(scri);
	}
	
	// Admin Page ��� ����
	@Override
	public void updateAmount(GoodsViewVO vo) throws Exception {
		dao.updateAmount(vo);
	}
		
	// Admin Page ���� ����
	@Override
	public void updatePrice(GoodsViewVO vo) throws Exception {
		dao.updatePrice(vo);
	}
	
	// Ring ����Ʈ
	@Override
	public List<GoodsViewVO> ringList() throws Exception {
		return dao.ringList();
	}
	
	// Earring ����Ʈ
	@Override
	public List<GoodsViewVO> earringList() throws Exception {
		return dao.earringList();
	}
				
	// Bracelet ����Ʈ
	@Override
	public List<GoodsViewVO> braceletList() throws Exception {
		return dao.braceletList();
	}
				
	// necklace ����Ʈ
	public List<GoodsViewVO> necklaceList() throws Exception {
		return dao.necklaceList();
	}
	
	// BRAND AAS ����Ʈ
	public List<GoodsViewVO> aasList() throws Exception{
		return dao.aasList();
	}
		
	// BRAND BBS ����Ʈ
	public List<GoodsViewVO> bbsList() throws Exception {
		return dao.bbsList();
	}

}
