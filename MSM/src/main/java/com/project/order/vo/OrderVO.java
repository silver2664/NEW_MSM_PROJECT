package com.project.order.vo;

import java.util.Date;

public class OrderVO {
/* orderNum VARCHAR2(30) not null,
    orderDate DATE DEFAULT sysdate not null,
    orderProductName VARCHAR2(30) not null,
    orderAmount VARCHAR2(10) not null,
    orderPrice VARCHAR2(30) not null,
    totalMoney VARCHAR2(30) not null,
    orderName VARCHAR2(10) not null,
    orderPhone varchar2(20) not null,
    orderAddr1 VARCHAR2(20) not null,
    orderAddr2 VARCHAR2(100) not null,
    orderAddr3 VARCHAR2(50) not null,
    orderReq VARCHAR2(100) not null,
    mid varchar2(20) not null,
    orderState varchar2(20) default '배송준비' 
    PRIMARY KEY(orderNum)
);

ALTER TABLE morder
	ADD CONSTRAINT order_mID_FK FOREIGN KEY(mid) REFERENCES MSM_MEMBER(MID);
    */
	

	private String orderNum; //주문번호
	private Date orderDate; //주문 날짜
	private String orderProductName; //상품명
	private String orderAmount; //상품수량
	private String orderPrice;  //상품가격
	private String totalMoney;  //주문 총금액
	private String orderName; //받는 사람
	private String orderPhone; //받는사람 폰 번호
	private String orderAddr1; //받는사람 우편번호
	private String orderAddr2; //받는사람 시군구
	private String orderAddr3; //받는사람 나머지 주소
	private String orderReq; //배송시 요청사항
	private String mId; //회원 아이디(주문자)
	private String orderState; //주문 상태 디폴트 '배송준비'
	
	
	
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderProductName() {
		return orderProductName;
	}
	public void setOrderProductName(String orderProductName) {
		this.orderProductName = orderProductName;
	}
	public String getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(String orderAmount) {
		this.orderAmount = orderAmount;
	}
	public String getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(String totalMoney) {
		this.totalMoney = totalMoney;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
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
	public String getOrderReq() {
		return orderReq;
	}
	public void setOrderReq(String orderReq) {
		this.orderReq = orderReq;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	
	
	
	
	
	
}
