package com.project.goods.dao;

import java.util.List;


import com.project.goods.vo.TabsVO;

public interface TabsDAO {
	
	// tabs ��ȸ
		public List<TabsVO> tabslist() throws Exception;
}
