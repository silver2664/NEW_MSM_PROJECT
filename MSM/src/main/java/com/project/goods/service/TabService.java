package com.project.goods.service;

import java.util.List;

import com.project.goods.vo.TabsVO;

public interface TabService {
	
	//tab 리스트 보기
		public List<TabsVO> tabslist() throws Exception;

}
