package com.project.msm.util;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.PlatformTransactionManager;

import com.project.msm.dao.BDaoTemplate;

public class Constant {

	public static JdbcTemplate template;
	public static PlatformTransactionManager transactionManager;
	public static BDaoTemplate dao;
	
}
