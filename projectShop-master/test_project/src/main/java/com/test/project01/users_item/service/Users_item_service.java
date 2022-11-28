package com.test.project01.users_item.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface Users_item_service {
	public void itemList(ModelAndView mView, HttpServletRequest request);
	public void getItemView(ModelAndView mView, int itemNum);
	public void cateList(int cateCode, int cateLevel, ModelAndView mView, HttpServletRequest request);
}
