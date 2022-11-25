package model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Order {

	private int order_id;
	private String product_id;
	private String addr;
	private String tel;
	private int totalPrice;
	private String member_id;
	private List<Item> items = new ArrayList<>();

	//	public Order(int order_id, String name, String postCode, String addr, String tel, String memo, Date dateRaised, String totalPrice, int status,Date dateClosed, Date dateCancelled) {
//		super();
//		this.order_id = order_id;
//		this.name = name;
//		this.postCode = postCode;
//		this.addr = addr;
//		this.tel = tel;
//		this.memo = memo;
//		this.dateRaised = dateRaised;
//		this.totalPrice = totalPrice;
//		this.status = status;
//		this.dateClosed = dateClosed;
//		this.dateCancelled = dateCancelled;
//	}
	private static Order makePending() {
		Order order = new Order();
		order.setStatus(1);
		return order;
	}
	public void confirm(Order order) {
		order.setStatus(2);
	}
	public void cancel(Order order) {
		order.setStatus(3);
	}
	public void close() { }
	public void addItem(Item Ordereditem) {
		items.add(Ordereditem);
	}

	public List<Item> getItems(){
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	public int getStatus() {
		return status;
	}
	public Object getOrder_id() {
		// TODO Auto-generated method stub
		return null;
	}
	public Object getProduct_id() {
		// TODO Auto-generated method stub
		return null;
	}
	public Object getAddr() {
		// TODO Auto-generated method stub
		return null;
	}
	public Object getTel() {
		// TODO Auto-generated method stub
		return null;
	}
	public Object getTotalPrice() {
		// TODO Auto-generated method stub
		return null;
	}
	public Object getMemberId() {
		// TODO Auto-generated method stub
		return null;
	}
}