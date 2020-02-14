package com.project.goods.dao;

import java.util.List;

import com.project.goods.vo.CategoryVO;
import com.project.goods.vo.GoodsVO;
import com.project.goods.vo.GoodsViewVO;
import com.project.goods.vo.ReplyVO;

public interface GoodsDAO {
	
	// 01. 상품목록
	public List<GoodsVO> listProduct() throws Exception;
	
	// 02. 상품상세
	public GoodsViewVO detailProduct(int mgNum);
	
	// 03. 상품수정
	public void productModify(GoodsVO vo)throws Exception;
	
	// 04. 상품삭제
	public void productDelete(int mgNum);
	
	// 05. 상품 등록
	public void register(GoodsVO vo)throws Exception;
	
	//카테고리
	public List<CategoryVO> category() throws Exception; 
	
	//카테 리스트
	public List<GoodsViewVO> catelist(int cateCode) throws Exception;
	
	
	

}
