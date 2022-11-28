package com.test.project01.cart.dto;

import java.util.Date;

public class CartListDto {
	private int cartNum;
	private String userId;
	private int itemNum;
	private int cartStock;
	private Date addDate;
	private int num;
	private String itemName;
	private int itemPrice;
	private String itemImg;
	private int money;
	private int itemCount;
	
	public CartListDto() {}

	public CartListDto(int cartNum, String userId, int itemNum, int cartStock, Date addDate, int num, String itemName,
			int itemPrice, String itemImg, int money) {
		super();
		this.cartNum = cartNum;
		this.userId = userId;
		this.itemNum = itemNum;
		this.cartStock = cartStock;
		this.addDate = addDate;
		this.num = num;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemImg = itemImg;
		this.money = (int)(itemPrice*cartStock);
	}
	
	public int getItemCount() {
		return itemCount;
	}

	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}

	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
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
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
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

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}	
	
}
