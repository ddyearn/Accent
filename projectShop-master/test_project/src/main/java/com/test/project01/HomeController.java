package com.test.project01;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.unknown.service.Unknown_service;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	Unknown_service serviec;
	
	
	@RequestMapping("/home.do")
	public String home(HttpServletRequest request) {
	return "home";
	}
	
	@RequestMapping("/index.do")
	public ModelAndView index(ModelAndView mView) {
		serviec.bestItemList(mView);
		serviec.newItemList(mView);
		mView.setViewName("index");
	return mView;
	}
	
}
