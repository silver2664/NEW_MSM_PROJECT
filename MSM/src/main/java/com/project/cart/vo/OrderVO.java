package com.project.cart.vo;

import java.util.Date;

public class OrderVO {
/* oNum    number not null,
    mId varchar2(50) not null,
    orderAddr1 VARCHAR2(20) not null,
    orderAddr2 varchar2(100)    not null,
    orderAddr3 varchar2(100) not null,
    amount number not null,
    orderDate Date default sysdate,
    orderRec varchar2(50) not null
    primary key(oNum)
    
    */
	
	private int oNum;
	private String mId;
	private String orderAddr1;
	private String orderAddr2;
	private String orderAddr3;
	private int amount;
	private Date orderDate;
	private String orderRec;
	
	
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getOrderAddr1() {
		return orderAddr1;
	}
	public void setOrderAddr1(String orderAddr1) {
		this.orderAddr1 = orderAddr1;
	}
	public String getOrderAddr2() {
		return orderAddr2;
	}
	public void setOrderAddr2(String orderAddr2) {
		this.orderAddr2 = orderAddr2;
	}
	public String getOrderAddr3() {
		return orderAddr3;
	}
	public void setOrderAddr3(String orderAddr3) {
		this.orderAddr3 = orderAddr3;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderRec() {
		return orderRec;
	}
	public void setOrderRec(String orderRec) {
		this.orderRec = orderRec;
	}
	
	
}
