package com.project.goods.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.goods.dao.GoodsDAO;
import com.project.goods.vo.CategoryVO;
import com.project.goods.vo.GoodsVO;
import com.project.goods.vo.GoodsViewVO;
import com.project.goods.vo.ReplyVO;

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

		
	}
	


