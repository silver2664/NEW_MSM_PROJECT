package com.project.cart.vo;

public class OrderDetailVO {
	/*
	 * orderDetailsNum number not null,
    oNum number not null,
    cartStock number not null,
    mgNum number not null,
    primary key(orderDetailsNum)
	 */

	private int orderDetaisNum;
	private int Onum;
	private int cartStock;
	private int mgNum;
	
	
	public int getOrderDetaisNum() {
		return orderDetaisNum;
	}
	public void setOrderDetaisNum(int orderDetaisNum) {
		this.orderDetaisNum = orderDetaisNum;
	}
	public int getOnum() {
		return Onum;
	}
	public void setOnum(int onum) {
		Onum = onum;
	}
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public int getMgNum() {
		return mgNum;
	}
	public void setMgNum(int mgNum) {
		this.mgNum = mgNum;
	}
	
	
}
