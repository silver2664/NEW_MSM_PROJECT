package com.project.goods.dao;

import java.util.List;

import com.project.goods.vo.GoodsVO;

public interface GoodsDAO {
	
	// 01. ��ǰ���
	public List<GoodsVO> listProduct() throws Exception;
	
	// 02. ��ǰ��
	public GoodsVO detailProduct(int mgNum);
	
	// 03. ��ǰ����
	public void productModify(GoodsVO vo)throws Exception;
	
	// 04. ��ǰ����
	public void productDelete(int mgNum);
	
	// 05. ��ǰ ���
	public void register(GoodsVO vo)throws Exception;
	

}
