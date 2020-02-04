package com.project.goods.service;

import java.util.List;

import com.project.goods.vo.GoodsVO;

public interface GoodsService {
	
	// 01. ��ǰ���
	public List<GoodsVO> listProduct() throws Exception;
	
	// 02. ��ǰ��
	public GoodsVO detailProduct(int mgNum);
	
	// 03. ��ǰ����
	public void updateProduct(GoodsVO vo);
	
	// 04. ��ǰ����
	public void deleteProduct(int mgNum);
	
	//05. ��ǰ���
	public void register(GoodsVO vo) throws Exception;
}
