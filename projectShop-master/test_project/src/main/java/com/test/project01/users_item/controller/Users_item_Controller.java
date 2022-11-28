package com.test.project01.users_item.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.qna.service.QnaService;
import com.test.project01.review.service.ReviewService;
import com.test.project01.users_item.service.Users_item_service;

@Controller
public class Users_item_Controller {
	
	@Autowired
	Users_item_service serviec;
	@Autowired
	ReviewService reviewService;
	@Autowired
	QnaService qnaService;
	
	@RequestMapping("/Users_Item/itemAllList")
	public ModelAndView Users_itemList(ModelAndView mView, HttpServletRequest request) {
		serviec.itemList(mView, request);
		mView.setViewName("Users_Item/itemAllList");
		return mView;
	}
	@RequestMapping("/Users_Item/itemView_form")
	public ModelAndView Users_itemView_form(HttpServletRequest request, @RequestParam int itemNum, ModelAndView mView,@RequestParam int pageNum,@RequestParam int reviewNum) {
		serviec.getItemView(mView, itemNum);
		reviewService.list2(request);
		String itemNum2=Integer.toString(itemNum);
		qnaService.getList2(request, itemNum2);
		mView.setViewName("Users_Item/itemView_form");
		return mView;
	}
	@RequestMapping("/Users_Item/itemList")
	public ModelAndView Users_getCateList(@RequestParam int cateCode, @RequestParam int cateLevel, ModelAndView mView,
			HttpServletRequest request) {
		serviec.cateList(cateCode, cateLevel, mView, request);
		mView.setViewName("Users_Item/itemList");
		return mView;
	}
}
