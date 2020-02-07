package com.project.goods.dao;

import java.util.List;

import com.project.goods.vo.GoodsVO;

public interface GoodsDAO {
	
	// 01. 상품목록
	public List<GoodsVO> listProduct() throws Exception;
	
	// 02. 상품상세
	public GoodsVO detailProduct(int mgNum);
	
	// 03. 상품수정
	public void productModify(GoodsVO vo)throws Exception;
	
	// 04. 상품삭제
	public void productDelete(int mgNum);
	
	// 05. 상품 등록
	public void register(GoodsVO vo)throws Exception;
	

}
