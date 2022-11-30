package com.test.project01.users_item.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.users_item.Dao.Users_item_Dao;
import com.test.project01.users_item.Dto.Users_item_Dto;

import net.sf.json.JSONArray;

@Service
public class Users_item_serviceImpl implements Users_item_service{
	
	@Autowired
	Users_item_Dao dao;
	
	static final int PAGE_ROW_COUNT = 12;
	static final int PAGE_DISPLAY_COUNT= 5;	
	
	@Override
	public void itemList(ModelAndView mView, HttpServletRequest request) {
		Users_item_Dto dto = new Users_item_Dto();
		int pageNum = 1;
		String strPageNum = request.getParameter("pageNum");
		if(strPageNum != null) {
			pageNum = Integer.parseInt(strPageNum);
		}
		int startRowNum = 1+(pageNum - 1)*PAGE_ROW_COUNT;
		int endRowNum = pageNum*PAGE_ROW_COUNT;
		
		int totalRow = dao.itemList_Count();
		int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		int startPageNum = 1+((pageNum - 1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
		if(totalPageCount < endPageNum) {
			endPageNum = totalPageCount;
		}
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		List<Users_item_Dto> list = dao.itemList(dto);
		mView.addObject("list", JSONArray.fromObject(list));	
		request.setAttribute("startPageNum", startPageNum);	
		request.setAttribute("endPageNum", endPageNum);	
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);	
		request.setAttribute("totalRow", totalRow);	
		mView.addObject("list", list);
	}

	@Override
	public void getItemView(ModelAndView mView, int itemNum) {
		Users_item_Dto dto = dao.itemViewData(itemNum);
		mView.addObject("dto", dto);
	}

	@Override
	public void cateList(int cateCode, int cateLevel, ModelAndView mView, HttpServletRequest request) {
		Users_item_Dto dto = new Users_item_Dto();
		int cateCodeRef = 0;
		if(cateLevel == 1) {
			int pageNum = 1;
			String strPageNum = request.getParameter("pageNum");
			if(strPageNum != null) {
				pageNum = Integer.parseInt(strPageNum);
			}
			int startRowNum = 1+(pageNum - 1)*PAGE_ROW_COUNT;
			int endRowNum = pageNum*PAGE_ROW_COUNT;
			
			int totalRow = dao.cateList1_Count(cateCode, cateCodeRef);
			int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
			int startPageNum = 1+((pageNum - 1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
			int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
			if(totalPageCount < endPageNum) {
				endPageNum = totalPageCount;
			}
			cateCodeRef = cateCode;
			dto.setStartRowNum(startRowNum);
			dto.setEndRowNum(endRowNum);
			dto.setCateCode(String.valueOf(cateCode));
			dto.setCateCodeRef(String.valueOf(cateCodeRef));
			
			List<Users_item_Dto> list = dao.cateList1(dto);
			mView.addObject("list", JSONArray.fromObject(list));	
			request.setAttribute("cateLevel", cateLevel);
			request.setAttribute("cateCode", cateCode);
			request.setAttribute("startPageNum", startPageNum);	
			request.setAttribute("endPageNum", endPageNum);	
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("totalPageCount", totalPageCount);	
			request.setAttribute("totalRow", totalRow);	
		}else {
			int pageNum = 1;
			String strPageNum = request.getParameter("pageNum");
			if(strPageNum != null) {
				pageNum = Integer.parseInt(strPageNum);
			}
			int startRowNum = 1+(pageNum - 1)*PAGE_ROW_COUNT;
			int endRowNum = pageNum*PAGE_ROW_COUNT;
			
			int totalRow = dao.cateList2_Count(cateCode);
			int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
			int startPageNum = 1+((pageNum - 1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
			int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
			if(totalPageCount < endPageNum) {
				endPageNum = totalPageCount;
			}
			dto.setStartRowNum(startRowNum);
			dto.setEndRowNum(endRowNum);
			dto.setCateCode(String.valueOf(cateCode));
			
			List<Users_item_Dto> list = dao.cateList2(dto);
			mView.addObject("list", JSONArray.fromObject(list));
			request.setAttribute("cateLevel", cateLevel);
			request.setAttribute("cateCode", cateCode);
			request.setAttribute("startPageNum", startPageNum);	
			request.setAttribute("endPageNum", endPageNum);	
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("totalPageCount", totalPageCount);	
			request.setAttribute("totalRow", totalRow);	
		}
	}
}
