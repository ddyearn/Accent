package com.test.project01.unknown.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface Unknown_service {
	public void itemList(ModelAndView mView, HttpServletRequest request);
	public void getItemView(ModelAndView mView, int itemNum);
	public void cateList(int cateCode, int cateLevel, HttpServletRequest request, ModelAndView mView);
	public void bestItemList(ModelAndView mView);
	public void newItemList(ModelAndView mView);
}
