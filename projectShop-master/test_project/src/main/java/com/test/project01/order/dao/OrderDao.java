package com.test.project01.order.dao;


import java.util.List;

import com.test.project01.order.dto.OrdersDto;

public interface OrderDao {
	//해당 아이디의 주문번호 리스트 (ASC)
	public List<Integer> getOrderNum(String userId);
	//주문추가
	public void insert(OrdersDto dto);
	//주문정보
	public List<OrdersDto> orderInfo(OrdersDto dto);
	
	//해당 아이디의 주문번호 리스트 (DESC)
	public List<Integer> getOrderNum2(String userId);
	
	public void itemGetCount(int itemNum);
}
