package com.test.project01.order.dao;

import java.util.List;

import com.test.project01.order.dto.OrderDetailDto;
import com.test.project01.order.dto.OrderDetailJoinDto;
import com.test.project01.order.dto.OrdersDto;

public interface OrderDetailDao {
	//주문상세내역 추가
	public void detailInsert(OrderDetailDto dto);
	//전체 리스트(전체주문내역, tbl_items,orders,order_detail 테이블 조인)
	public List<OrderDetailJoinDto> getList(OrderDetailJoinDto dto);
	
}
