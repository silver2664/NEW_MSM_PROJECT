package com.project.goods.dao;

import java.util.List;

import com.project.board.vo.SearchCriteria;
import com.project.goods.vo.CategoryVO;
import com.project.goods.vo.GoodsVO;
import com.project.goods.vo.GoodsViewVO;

public interface GoodsDAO {
	
	// 01. ��ǰ���
	public List<GoodsVO> listProduct() throws Exception;
	
	// 02. ��ǰ��
	public GoodsViewVO detailProduct(int mgNum);
	
	// 03. ��ǰ����
	public void productModify(GoodsVO vo)throws Exception;
	
	// 04. ��ǰ����
	public void productDelete(int mgNum);
	
	// 05. ��ǰ ���
	public void register(GoodsVO vo)throws Exception;
	
	//ī�װ�
	public List<CategoryVO> category() throws Exception; 
	
	//ī�� ����Ʈ
	public List<GoodsViewVO> catelist(int cateCode) throws Exception;
	
	// ��� ��ǰ ��ȸ
	public List<GoodsViewVO> getGoodsList(SearchCriteria scri) throws Exception;
	
	// �Խù� ����
	public int listCount(SearchCriteria scri) throws Exception;
	
	// Admin Page ��� ����
	public void updateAmount(GoodsViewVO vo) throws Exception;
	
	// Admin Page ���� ����
	public void updatePrice(GoodsViewVO vo) throws Exception;
	
	// Ring ����Ʈ
	public List<GoodsViewVO> ringList() throws Exception;
	
	// Earring ����Ʈ
	public List<GoodsViewVO> earringList() throws Exception;
		
	// Bracelet ����Ʈ
	public List<GoodsViewVO> braceletList() throws Exception;
		
	// necklace ����Ʈ
	public List<GoodsViewVO> necklaceList() throws Exception;
	
	// BRAND AAS ����Ʈ
	public List<GoodsViewVO> aasList() throws Exception;
	
	// BRAND BBS ����Ʈ
	public List<GoodsViewVO> bbsList() throws Exception;

}
