package com.test.project01.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.project01.order.dto.OrderDetailDto;
import com.test.project01.order.dto.OrderDetailJoinDto;

@Repository
public class OrderDetailDaoImpl implements OrderDetailDao{
	@Autowired
	SqlSession session;

	@Override
	public void detailInsert(OrderDetailDto dto) {
		session.insert("order.detailInsert",dto);
	}

	@Override
	public List<OrderDetailJoinDto> getList(OrderDetailJoinDto dto) {
		return session.selectList("order.getList",dto);
		
	}
	
	
}
