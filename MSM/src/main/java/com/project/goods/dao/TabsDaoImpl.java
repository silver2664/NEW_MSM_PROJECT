package com.project.goods.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.project.goods.vo.TabsVO;

@Repository
public class TabsDaoImpl implements TabsDAO {
	@Inject
	SqlSession sqlSession;

	
	@Override
	public List<TabsVO> tabslist() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("tabsMapper.tabslist");
	}

}
