package com.project.msm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

import com.project.msm.dto.BDto;
import com.project.msm.util.Constant;

public class BDao {
	JdbcTemplate template;
	DataSource dataSource;
	
	public BDao() {
		this.template = Constant.template;
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace( );
		}
	}
	
	public ArrayList<BDto> list()	 {
		String query = "select bId, bTitle,mid,bview,bdate"
				+ "	 from notice order by bid desc";
		return (ArrayList<BDto>) template.query(query, new BeanPropertyRowMapper<BDto>(BDto.class));
	}
	
	public void write(final String btitle,final String mid,final String bcontent) {
		this.template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				String query = "insert into notice (bid,btitle,bcontent,bview,mid,bdate)"
						+ "values (NOTICE_SEQ.NEXTVAL,?,?,1,?,sysdate)";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, btitle);
				pstmt.setString(2, bcontent);
				pstmt.setString(3, mid);
				return pstmt;
			}			
		});		
	}
	
	public BDto contentView(String strId) {
		BDto dto = null;
		Connection connection = null;
		PreparedStatement psmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			
			String query = "select * from notice where bid=?";
			psmt = connection.prepareStatement(query);
			psmt.setInt(1, Integer.parseInt(strId));
			resultSet = psmt.executeQuery();
			
			if(resultSet.next()) {
				int bId = resultSet.getInt("bid");
				String btitle = resultSet.getString("btitle");
				String bcontent = resultSet.getString("bcontent");
				String mid = resultSet.getString("mid");
				String  bdate = resultSet.getString("bdate");
				int bview = resultSet.getInt("bview");
				
				dto = new BDto(bId,btitle,bdate,bcontent,mid,bview);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet != null) {
					resultSet.close();
				}
				if(psmt != null) {
					psmt.close();
				}
				if(connection != null) {
					connection.close();
				}
			} catch (Exception e2) {				

			}	
		}
		return dto;
	}

	public void delete(String bId) {
		Connection connection = null;
		PreparedStatement psmt = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "delete from notice where bid =?";
			psmt = connection.prepareStatement(query);
			psmt.setInt(1, Integer.parseInt(bId));
			int rn = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(psmt != null)
					psmt.close();
				if(connection != null)
					connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			
		} 
		
	}

	public void modify(String bid, String mid, String btitle, String bcontent) {
		Connection connection = null;
		PreparedStatement psmt = null;
		
		try {
			connection  = dataSource.getConnection();
			
			String query = "update notice set mid=?,btitle=?,bcontent=? where bid=?";
			psmt = connection.prepareStatement(query);
			psmt.setString(1, mid);
			psmt.setString(2, btitle);
			psmt.setString(3, bcontent);
			psmt.setInt(4, Integer.parseInt(bid));
			
			int rn = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(psmt != null) 
					psmt.close();
				if(connection !=null)
					connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
	}	
		
}
