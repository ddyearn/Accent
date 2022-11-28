package com.test.project01.master.category.serevice;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.test.project01.master.category.Dto.ItemDto;
import com.test.project01.order.dto.OrdersDto;
import com.test.project01.users.Dto.UsersDto;

public interface categoryService {
	public void categoryList(ModelAndView mView);
	public void itemInsert(ItemDto dto);
	public void itemList(ModelAndView mView, HttpServletRequest request);
	public void getItemView(ModelAndView mView, int itemNum);
	public void getItemViewList(ModelAndView mView, int itemNum);
	public void getItemUpdateDate(ItemDto dto);
	public void itemDelete(int itemNum, HttpServletRequest request);
	public void OrderList(ModelAndView mView, HttpServletRequest request);
	public void upResult(OrdersDto Dto);
	public void getUserAllList(ModelAndView mView, HttpServletRequest request);
	public void userVerify(UsersDto userDto);
}
