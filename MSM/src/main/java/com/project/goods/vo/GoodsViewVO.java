package com.project.goods.vo;

import org.springframework.web.multipart.MultipartFile;

public class GoodsViewVO {

	
	private int mgNum;
	private String mgName;
	private int mgPrice;
	private int mgStock;
	private String mgContent;
	private String mgImg; // 상품이미지경로
	private MultipartFile productPhoto; // 상품이미지파일
	private String mgThumbImg;
	private String cateCode;
	
	
	
	
	private String cateName;
	private String cateCodeRef;
	
	
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
	public int getMgStock() {
		return mgStock;
	}
	public void setMgStock(int mgStock) {
		this.mgStock = mgStock;
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
	public String getMgThumbImg() {
		return mgThumbImg;
	}
	public void setMgThumbImg(String mgThumbImg) {
		this.mgThumbImg = mgThumbImg;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getCateCodeRef() {
		return cateCodeRef;
	}
	public void setCateCodeRef(String cateCodeRef) {
		this.cateCodeRef = cateCodeRef;
	}
	
	
}
