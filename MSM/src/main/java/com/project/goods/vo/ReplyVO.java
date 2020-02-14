package com.project.goods.vo;

import java.util.Date;

public class ReplyVO {
	
	/*
	  create table reply (
    mgNum number not null,
    mId VARCHAR2(20) not NULL,
    repNum number not null,
    repCon VARCHAR2(2000) not null,
    repDate date default sysdate,
    primary key(mgNum,repNum)
	);

	create sequence reply_seq;

	alter table reply
    	add constraint reply_mgNum foreign key(mgNum)
    	REFERENCES ex_goods(mgNum);
    
	alter table reply
    	add constraint reply_mId foreign key(mId)
    	REFERENCES msm_member(mId);
	 */
	
	private int mgNum;
	private String mId;
	private int repNum;
	private String reoCon;
	private Date repDate;
	
	
	public int getMgNum() {
		return mgNum;
	}
	public void setMgNum(int mgNum) {
		this.mgNum = mgNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getRepNum() {
		return repNum;
	}
	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}
	public String getReoCon() {
		return reoCon;
	}
	public void setReoCon(String reoCon) {
		this.reoCon = reoCon;
	}
	public Date getRepDate() {
		return repDate;
	}
	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}
	
	

}
