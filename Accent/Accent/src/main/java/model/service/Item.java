package model.service;

public class Item {
	private int iCode;
	private int price;
	private int quantity;
	private String summary;
	
	public Item(int iCode, int price, int quantity, String summary) {
		this.iCode = iCode;
		this.price = price;
		this.quantity = quantity;
		this.summary = summary;
	}
	
	public int getIcode() {
		return iCode;
	}
	public void setICode(int iCode) {
		this.iCode = iCode;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String display() {
		String s = "";
		
		s += "item: " + getIcode() + ", price:  " + getPrice();
		return s;
	}
}