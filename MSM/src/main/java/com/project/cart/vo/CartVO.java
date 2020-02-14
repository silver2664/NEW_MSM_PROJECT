package com.project.cart.vo;

public class CartVO {
	
	/*
	-- Cart ���̺� ����
	CREATE TABLE ex_cart(
    CART_ID NUMBER NOT NULL PRIMARY KEY,
    USER_ID VARCHAR2(50) NOT NULL,
    PRODUCT_ID NUMBER NOT NULL,
    AMOUNT NUMBER DEFAULT 0
	);
	
	-- Cart ���̺� �ܷ�Ű ����
	ALTER TABLE EX_CART
	ADD CONSTRAINT CART_USERID_FK FOREIGN KEY(USER_ID) REFERENCES MSM_MEMBER(MID);

	ALTER TABLE EX_CART
	ADD CONSTRAINT CART_PRODUCT_ID FOREIGN KEY(PRODUCT_ID) REFERENCES EX_GOODS(MGNUM);
	 */
	
	private int cartId; // ��ٱ��� ��ȣ
	private String userId; // ����� ���̵�
	private String userName; // ����� �̸�
	private int productId; // ��ǰ��ȣ
	private String productName; // ��ǰ�̸�
	private int productPrice; // ��ǰ�ܰ�
	private int amount; // ���� ����
	private int money; // ��ǰ ����
	private int mgNum;
		
	public int getMgNum() {
		return mgNum;
	}
	public void setMgNum(int mgNum) {
		this.mgNum = mgNum;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	
	

}
