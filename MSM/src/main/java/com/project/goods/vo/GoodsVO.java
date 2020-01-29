package com.project.goods.vo;

import org.springframework.web.multipart.MultipartFile;

public class GoodsVO {
	
	/*
	 CREATE TABLE EX_GOODS (
    MGNUM   NUMBER NOT NULL,
    MGNAME VARCHAR2(100),
    MGPRICE NUMBER DEFAULT 0,
    MGCONTENT VARCHAR2(500),
    MGIMG VARCHAR2(500),
    PRIMARY KEY (MGNUM)    
	);
	 */

	private int mgNum;
	private String mgName;
	private int mgPrice;
	private String mgContent;
	private String mgImg; // 상품이미지경로
	private MultipartFile productPhoto; // 상품이미지파일
	public int getMgNum() {
		return mgNum;
	}
	public void setMgNum(int mgNum) {
		this.mgNum = mgNum;
	}
	public String getMgName() {
		return mgName;
	}
	public void setMgName(String mgName) {
		this.mgName = mgName;
	}
	public int getMgPrice() {
		return mgPrice;
	}
	public void setMgPrice(int mgPrice) {
		this.mgPrice = mgPrice;
	}
	public String getMgContent() {
		return mgContent;
	}
	public void setMgContent(String mgContent) {
		this.mgContent = mgContent;
	}
	public String getMgImg() {
		return mgImg;
	}
	public void setMgImg(String mgImg) {
		this.mgImg = mgImg;
	}
	public MultipartFile getProductPhoto() {
		return productPhoto;
	}
	public void setProductPhoto(MultipartFile productPhoto) {
		this.productPhoto = productPhoto;
	}
	
	@Override
	public String toString() {
		return "GoodsVO [mgNum=" + mgNum + ", mgName=" + mgName + ", mgPrice=" + mgPrice + ", mgContent=" + mgContent + ", mgImg="
				+ mgImg + "]";
	}
}
