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
	
	//상품목록
	@Override
	public List<GoodsVO> listProduct() throws Exception {
		return dao.listProduct();
	}
	//상품 상세보기
	@Override
	public GoodsViewVO detailProduct(int mgNum) {
		return dao.detailProduct(mgNum);
	}
	//상품수정
	@Override
	public void productModify(GoodsVO vo) throws Exception {
		dao.productModify(vo);

	}
	//상품삭제
	@Override
	public void productDelete(int mgNum) {
		dao.productDelete(mgNum);

	}
	//상품등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.register(vo);		
	}
	//카테고리 조회
	@Override
	public List<CategoryVO> category() throws Exception {
		// TODO Auto-generated method stub
		return dao.category();
	}
	//카테고리별 리스트
	@Override
	public List<GoodsViewVO> catelist(int cateCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.catelist(cateCode);
	}
	
	// 모든 상품 조회
	public List<GoodsViewVO> getGoodsList(SearchCriteria scri) throws Exception{
		return dao.getGoodsList(scri);
	}
			
	// 게시물 갯수
	public int listCount(SearchCriteria scri) throws Exception{
		return dao.listCount(scri);
	}
	
	// Admin Page 재고 변경
	@Override
	public void updateAmount(GoodsViewVO vo) throws Exception {
		dao.updateAmount(vo);
	}
		
	// Admin Page 가격 변경
	@Override
	public void updatePrice(GoodsViewVO vo) throws Exception {
		dao.updatePrice(vo);
	}
	
	// Ring 리스트
	@Override
	public List<GoodsViewVO> ringList() throws Exception {
		return dao.ringList();
	}
	
	// Earring 리스트
	@Override
	public List<GoodsViewVO> earringList() throws Exception {
		return dao.earringList();
	}
				
	// Bracelet 리스트
	@Override
	public List<GoodsViewVO> braceletList() throws Exception {
		return dao.braceletList();
	}
				
	// necklace 리스트
	public List<GoodsViewVO> necklaceList() throws Exception {
		return dao.necklaceList();
	}
	
	// BRAND AAS 리스트
	public List<GoodsViewVO> aasList() throws Exception{
		return dao.aasList();
	}
		
	// BRAND BBS 리스트
	public List<GoodsViewVO> bbsList() throws Exception {
		return dao.bbsList();
	}

}
