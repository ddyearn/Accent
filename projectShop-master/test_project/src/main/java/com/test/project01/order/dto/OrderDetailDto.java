package com.test.project01.order.dto;

public class OrderDetailDto {
	private int odNum;
	private int orderNum;
	private int itemNum;
	private int quantity;
	private String result;
	
	public OrderDetailDto() {}

	public OrderDetailDto(int odNum, int orderNum, int itemNum,  int quantity,
			String result) {
		super();
		this.odNum = odNum;
		this.orderNum = orderNum;
		this.itemNum = itemNum;
		this.quantity = quantity;
		this.result = result;
	}

	public int getOdNum() {
		return odNum;
	}

	public void setOdNum(int odNum) {
		this.odNum = odNum;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
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

	
	
}
