package com.test.project01.order.service;

import javax.servlet.http.HttpServletRequest;

import com.test.project01.order.dto.OrdersDto;

public interface OrderService {
	//주문등록
	public void insert(HttpServletRequest request,OrdersDto dto);
	//주문폼에 장바구니 리스트내역도 같이 보여줌
	public void cartList_insertform(HttpServletRequest request);
	//주문리스트 확인
	public void orderList(HttpServletRequest request);
	//주문 상세정보
	public void orderInfo(HttpServletRequest request);
	//배달현황
	public void delivery(HttpServletRequest request);
}
