package com.test.project01.unknown.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.qna.service.QnaService;
import com.test.project01.review.service.ReviewService;
import com.test.project01.unknown.service.Unknown_service;

@Controller
public class Unknown_Controller {
	
	@Autowired
	Unknown_service serviec;
	@Autowired
	ReviewService reviewService;
	@Autowired
	QnaService qnaService;
	
	@RequestMapping("/Unknown/itemAllList")
	public ModelAndView itemList(ModelAndView mView, HttpServletRequest request) {
		serviec.itemList(mView, request);
		mView.setViewName("Unknown/itemAllList");
		return mView;
	}
	
	@RequestMapping("/Unknown/itemView_form")
	public ModelAndView itemView_form(HttpServletRequest request, @RequestParam int itemNum, ModelAndView mView) {
		serviec.getItemView(mView, itemNum);
		/*리뷰,Q&A 추가*/
		reviewService.list2(request);
		String itemNum2=Integer.toString(itemNum);
		qnaService.getList2(request, itemNum2);
		mView.setViewName("Unknown/itemView_form");
		return mView;
	}
	
	@RequestMapping("/Unknown/itemList")
	public ModelAndView getCateList(@RequestParam int cateCode, @RequestParam int cateLevel, ModelAndView mView, HttpServletRequest request) {
		serviec.cateList(cateCode, cateLevel, request, mView);
		mView.setViewName("Unknown/itemList");
		return mView;
	}
}
