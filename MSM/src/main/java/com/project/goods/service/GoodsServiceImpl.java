package com.project.goods.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.goods.dao.GoodsDAO;
import com.project.goods.vo.GoodsVO;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	
	@Inject
	GoodsDAO dao;
	
	@Override
	public List<GoodsVO> listProduct() throws Exception {
		return dao.listProduct();
	}

	@Override
	public GoodsVO detailProduct(int mgNum) {
		return dao.detailProduct(mgNum);
	}

	@Override
	public void updateProduct(GoodsVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteProduct(int mgNum) {
		// TODO Auto-generated method stub

	}

}
