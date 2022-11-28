package com.test.project01.order.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.order.dto.OrdersDto;
import com.test.project01.order.service.OrderService;
import com.test.project01.review.dto.ReviewDto;
import com.test.project01.review.service.ReviewService;

@Controller
public class OrderController {
	@Autowired
	OrderService service;
	@Autowired
	ReviewService reviewService;
	
	//주문폼
	@RequestMapping("/shop/orderform")
	public ModelAndView User_orderform(HttpServletRequest request,ModelAndView mView) {
		service.cartList_insertform(request);
		mView.setViewName("shop/orderform");
		return mView;
	}
	
	//주문
	@RequestMapping(value="/shop/order",method=RequestMethod.POST)
	public ModelAndView User_insert(HttpServletRequest request,ModelAndView mView,
			@ModelAttribute("dto") OrdersDto dto) {
		service.insert(request, dto);
		mView.setViewName("shop/order");
		return mView;
	}
	//구매내역
	@RequestMapping("/shop/orderList")
	public ModelAndView User_orderList(HttpServletRequest request,ModelAndView mView) {
		service.orderList(request);
		mView.setViewName("shop/orderList");
		return mView;
	}
	//해당 주문번호의 디테일
	@RequestMapping("/shop/detailList")
	public ModelAndView User_detailList(HttpServletRequest request,ModelAndView mView) {
		//주문 디테일
		service.orderInfo(request);
		mView.setViewName("shop/detailList");
		return mView;
	}
	//배송여부
	@RequestMapping("/shop/delivery")
	public ModelAndView User_delivery(HttpServletRequest request,ModelAndView mView) {
		service.delivery(request);
		mView.setViewName("shop/delivery");
		return mView;
	}
	//리뷰 중복여부
	@ResponseBody
	@RequestMapping(value="/shop/checkreview",method = RequestMethod.POST)
	public Map<String,Object> User_checkreview(HttpServletRequest request,@RequestParam int itemNum){
		boolean isExist=reviewService.isExist(request,itemNum);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isExist", isExist);
		System.out.println(isExist);
		System.out.println(itemNum);
		return map;
	
		
	}
}
