package com.test.project01.users_item.Dto;

public class Users_item_Dto {
	private int itemNum;
	private String itemName;
	private String cateCode;
	private int itemPrice;
	private int itemCount;
	private String itemDes;
	private String itemImg;
	private String itemDate;
	
	private String cateName;
	private String cateCodeRef;
	
	private String itemThumbImg;
	
	private int startRowNum;
	private int endRowNum;

	public Users_item_Dto() {}

	public int getStartRowNum() {
		return startRowNum;
	}


	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}


	public int getEndRowNum() {
		return endRowNum;
	}


	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}


	public int getItemNum() {
		return itemNum;
	}


	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}


	public String getItemName() {
		return itemName;
	}


	public void setItemName(String itemName) {
		this.itemName = itemName;
	}


	public String getCateCode() {
		return cateCode;
	}


	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}


	public int getItemPrice() {
		return itemPrice;
	}


	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}


	public int getItemCount() {
		return itemCount;
	}


	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}


	public String getItemDes() {
		return itemDes;
	}


	public void setItemDes(String itemDes) {
		this.itemDes = itemDes;
	}


	public String getItemImg() {
		return itemImg;
	}


	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}


	public String getItemDate() {
		return itemDate;
	}


	public void setItemDate(String itemDate) {
		this.itemDate = itemDate;
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


	public String getItemThumbImg() {
		return itemThumbImg;
	}


	public void setItemThumbImg(String itemThumbImg) {
		this.itemThumbImg = itemThumbImg;
	}
	
}