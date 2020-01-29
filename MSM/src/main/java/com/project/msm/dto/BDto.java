package com.project.msm.dto;

import java.util.Date;

public class BDto {
	
	/* NOTICE 
	 *  BID NUMBER(10, 0) NOT NULL 
		, BTITLE VARCHAR2(100 BYTE) 
		, BDATE DATE NOT NULL 
		, BCONTENT VARCHAR2(1000 BYTE) NOT NULL 
		, MID VARCHAR2(20 BYTE) 
	 * BVIEW NUMBER 
	 * */
	
	
	public int bid;
	public String btitle;
	public String bdate;
	public String bcontent;
	public String mid;
	public int bview;
	
	public int getBid() {
		return bid;
	}

	public String getBtitle() {
		return btitle;
	}

	public String getBdate() {
		return bdate;
	}

	public String getBcontent() {
		return bcontent;
	}

	public String getMid() {
		return mid;
	}

	public int getBview() {
		return bview;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public void setBview(int bview) {
		this.bview = bview;
	}

	public BDto(int bid, String btitle, String bdate, String bcontent, String mid,int bview) {
		super();
		this.bid = bid;
		this.btitle = btitle;
		this.bdate = bdate;
		this.bcontent = bcontent;
		this.mid = mid;
		this.bview = bview;
	}

	public BDto() {
		super();
	}
	
	
	
	
	
}
