package com.test.project01.cart.dto;

import java.util.Date;

public class wishlistDto {
	private int wishNum;
	private String userId;
	private int itemNum;
	private Date addDate;
	private int num;
	private String itemName;
	private int itemPrice;
	private String itemImg;

	public wishlistDto() {}

	public wishlistDto(int wishNum, String userId, int itemNum, Date addDate, int num, String itemName, int itemPrice,
			String itemImg) {
		super();
		this.wishNum = wishNum;
		this.userId = userId;
		this.itemNum = itemNum;
		this.addDate = addDate;
		this.num = num;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemImg = itemImg;
	}

	public int getWishNum() {
		return wishNum;
	}

	public void setWishNum(int wishNum) {
		this.wishNum = wishNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getItemImg() {
		return itemImg;
	}

	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}
}