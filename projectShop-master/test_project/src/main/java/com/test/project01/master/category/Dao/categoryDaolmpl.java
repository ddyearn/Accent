package com.test.project01.master.category.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.project01.master.category.Dto.ItemDto;
import com.test.project01.master.category.Dto.ItemViewDto;
import com.test.project01.master.category.Dto.Orders_Dto;
import com.test.project01.master.category.Dto.categoryDto;
import com.test.project01.order.dto.OrderDetailDto;
import com.test.project01.order.dto.OrdersDto;
import com.test.project01.users.Dto.UsersDto;


@Repository
public class categoryDaolmpl implements categoryDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<categoryDto> categoryList() {	
		List<categoryDto> list = session.selectList("category.list");
		return list;
	}

	@Override
	public void itemInsert(ItemDto dto) {
		session.insert("category.itemInsert", dto);
	}

	@Override
	public List<ItemDto> itemList(ItemDto dto) {
		List<ItemDto> list = session.selectList("category.itemSelect", dto);
		return list;
	}
	@Override
	public int getItemListCount() {
		List<ItemDto> list = session.selectList("category.itemSelect_Count");
		int count = list.size();
		return count;
	}
	
	@Override
	public ItemDto itemViewData(int itemNum) {
		return session.selectOne("category.itemViewContent", itemNum);
	}

	@Override
	public ItemViewDto itemViewList(int itemNum) {
		return session.selectOne("category.itemViewData", itemNum);
	}

	@Override
	public void ItemUpdate(ItemDto dto) {
		session.update("category.itemUpDate", dto);
	}

	@Override
	public void ItemDelete(int itemNum) {
		session.delete("category.itemDelete", itemNum);
	}


	@Override
	public void minusCount(OrderDetailDto detailDto) {
		session.update("category.minusCount",detailDto);
	}

	@Override
	public void upResult(OrdersDto Dto) {
		session.update("category.resultItem", Dto);
	}

	@Override
	public List<UsersDto> userAllList(UsersDto dto) {
		List<UsersDto> usersList = session.selectList("category.userAllList", dto);
		return usersList;
	}
	public int getUserAllCount() {
		List<UsersDto> dto = session.selectList("category.userAllList_Count");
		int count = dto.size();
		return count;
	}

	@Override
	public void userVerify(UsersDto userDto) {
		session.update("category.userVerify", userDto);
	}
	
	@Override
	public List<Orders_Dto> orderList(Orders_Dto dto) {
		List<Orders_Dto> orderList = session.selectList("category.select_orderList" , dto);
		return orderList;
	}

	@Override
	public int getOrderListCount() {
		List<Orders_Dto> dto = session.selectList("category.select_orderList_Count");
		int count = dto.size();
		return count;
	}	
}
