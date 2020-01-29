package com.project.msm.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.transaction.PlatformTransactionManager;

import com.project.msm.dto.UserDto;
import com.project.msm.util.Constant;

public class BDaoTemplate {
	
	JdbcTemplate template;
	
	@Autowired 
	public void setTemplate(JdbcTemplate template) { 
		this.template = template; 
	}
	 
	
	PlatformTransactionManager transactionManager;
	
	@Autowired 
	public void setTransactionManager(PlatformTransactionManager transactionManager) {
		this.transactionManager = transactionManager; 
	}
	 
	
	public BDaoTemplate() {
		this.template = Constant.template;
		this.transactionManager = Constant.transactionManager;
	}
	
	public UserDto login(String mId) {
		String sql = "SELECT * FROM MEMBER WHERE MID = '"+ mId +"'";
		// id로 select 하면 1개의 레코드만 나옴
		System.out.println("bdao login method execute.");
		return template.queryForObject(sql, new BeanPropertyRowMapper<UserDto>(UserDto.class));
	}
	
	public String join(UserDto dto) {
		String mId = dto.getmId(); // 내부의 익명의 클래스에서 사용되므로 final 변수 선언, 자바 1.8 이상부터는 final 선언 안해줘도 됨. 
		String mPw = dto.getmPw();
		String mEmail = dto.getmEmail();
		int result;
		String sql = "INSERT INTO MEMBER(MID, MPW, MEMAIL) VALUES(?, ?, ?)";
		System.out.println("test2");
		try {
			result = template.update(sql, new PreparedStatementSetter() {
				@Override
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setString(1, mId);
					ps.setString(2, mPw);
					ps.setString(3, mEmail);
				}
			});
		}
		catch(Exception e) {
			e.printStackTrace();
			return "join-failed";
		}
		
		System.out.println(result);
		
		if(result > 0) {
			return "join-success";
		}
		else {
			return "join-failed";
		}
	}

}
