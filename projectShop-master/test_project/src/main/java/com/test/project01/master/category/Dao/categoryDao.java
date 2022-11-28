package com.test.project01.master.category.Dao;

import java.util.List;

import com.test.project01.master.category.Dto.ItemDto;
import com.test.project01.master.category.Dto.ItemViewDto;
import com.test.project01.master.category.Dto.Orders_Dto;
import com.test.project01.master.category.Dto.categoryDto;
import com.test.project01.order.dto.OrderDetailDto;
import com.test.project01.order.dto.OrdersDto;
import com.test.project01.users.Dto.UsersDto;

public interface categoryDao {
	public List<categoryDto> categoryList();
	public void itemInsert(ItemDto dto);
	
	public List<ItemDto> itemList(ItemDto dto);
	public int getItemListCount();
	
	public ItemDto itemViewData(int itemNum);
	public ItemViewDto itemViewList(int itemNum);
	public void ItemUpdate(ItemDto dto);
	public void ItemDelete(int itemNum);

	public void minusCount(OrderDetailDto detailDto);
	
	public List<Orders_Dto> orderList(Orders_Dto dto);
	public int getOrderListCount();
	public void upResult(OrdersDto Dto);

	public List<UsersDto> userAllList(UsersDto dto);
	public int getUserAllCount();
	public void userVerify(UsersDto userDto);
	
	
}
