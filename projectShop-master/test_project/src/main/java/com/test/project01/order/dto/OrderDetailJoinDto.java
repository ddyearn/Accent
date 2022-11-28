package com.test.project01.order.dto;

public class OrderDetailJoinDto {
	private int orderNum;
	private String orderRec;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String orderPhone1;
	private String orderPhone2;
	private String orderDate;
	private String delivery;
	private String payment;
	private int allPrice;
	private int itemNum;
	private String itemName;
	private String itemImg;
	private int itemPrice;
	private int quantity;
	private String result;
	private String userId;
	
	 
	public OrderDetailJoinDto() {}


	public OrderDetailJoinDto(int orderNum, String orderRec, String userAddr1, String userAddr2, String userAddr3,
			String orderPhone1, String orderPhone2, String orderDate, String delivery, String payment, int allPrice,
			int itemNum, String itemName, String itemImg, int itemPrice,int quantity, String result, String userId) {
		super();
		this.orderNum = orderNum;
		this.orderRec = orderRec;
		this.userAddr1 = userAddr1;
		this.userAddr2 = userAddr2;
		this.userAddr3 = userAddr3;
		this.orderPhone1 = orderPhone1;
		this.orderPhone2 = orderPhone2;
		this.orderDate = orderDate;
		this.delivery = delivery;
		this.payment = payment;
		this.allPrice = allPrice;
		this.itemNum = itemNum;
		this.itemName = itemName;
		this.itemImg = itemImg;
		this.itemPrice=itemPrice;
		this.quantity = quantity;
		this.result = result;
		this.userId = userId;
	}


	public int getOrderNum() {
		return orderNum;
	}


	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}


	public String getOrderRec() {
		return orderRec;
	}


	public void setOrderRec(String orderRec) {
		this.orderRec = orderRec;
	}


	public String getUserAddr1() {
		return userAddr1;
	}


	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}


	public String getUserAddr2() {
		return userAddr2;
	}


	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}


	public String getUserAddr3() {
		return userAddr3;
	}


	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}


	public String getOrderPhone1() {
		return orderPhone1;
	}


	public void setOrderPhone1(String orderPhone1) {
		this.orderPhone1 = orderPhone1;
	}


	public String getOrderPhone2() {
		return orderPhone2;
	}


	public void setOrderPhone2(String orderPhone2) {
		this.orderPhone2 = orderPhone2;
	}


	public String getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}


	public String getDelivery() {
		return delivery;
	}


	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}


	public String getPayment() {
		return payment;
	}


	public void setPayment(String payment) {
		this.payment = payment;
	}


	public int getAllPrice() {
		return allPrice;
	}


	public void setAllPrice(int allPrice) {
		this.allPrice = allPrice;
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


	public String getItemImg() {
		return itemImg;
	}


	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}

	public int getItemPrice() {
		return itemPrice;
	}


	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	
	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public String getResult() {
		return result;
	}


	public void setResult(String result) {
		this.result = result;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	
	
	
	
}
