package com.project.goods.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.goods.dao.TabsDAO;
import com.project.goods.vo.TabsVO;

@Service
public class TabServiceImpl implements TabService {
	
	@Inject
	TabsDAO dao;

	@Override
	public List<TabsVO> tabslist() throws Exception {
		// TODO Auto-generated method stub
		return dao.tabslist();
	}

}
