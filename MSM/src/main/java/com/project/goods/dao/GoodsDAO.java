package com.project.goods.dao;

import java.util.List;

import com.project.goods.vo.CategoryVO;
import com.project.goods.vo.GoodsVO;
import com.project.goods.vo.GoodsViewVO;
import com.project.goods.vo.ReplyVO;

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
	
	
	

}
