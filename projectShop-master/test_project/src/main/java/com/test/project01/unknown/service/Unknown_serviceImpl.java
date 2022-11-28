package com.test.project01.unknown.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.master.category.Dto.ItemDto;
import com.test.project01.unknown.Dao.Unknown_Dao;
import com.test.project01.unknown.Dto.Unknown_itemDto;

import net.sf.json.JSONArray;

@Service
public class Unknown_serviceImpl implements Unknown_service{
	
	@Autowired
	Unknown_Dao dao;
	
	static final int PAGE_ROW_COUNT = 12;
	static final int PAGE_DISPLAY_COUNT= 5;	
	
	@Override
	public void itemList(ModelAndView mView, HttpServletRequest request) {
		Unknown_itemDto dto = new Unknown_itemDto();
		int pageNum = 1;
		String strPageNum = request.getParameter("pageNum");
		if(strPageNum != null) {
			pageNum = Integer.parseInt(strPageNum);
		}
		int startRowNum = 1+(pageNum - 1)*PAGE_ROW_COUNT;
		int endRowNum = pageNum*PAGE_ROW_COUNT;
		
		int totalRow = dao.itemListCount();
		int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		int startPageNum = 1+((pageNum - 1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
		if(totalPageCount < endPageNum) {
			endPageNum = totalPageCount;
		}
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		List<Unknown_itemDto> list = dao.itemList(dto);
		mView.addObject("list", JSONArray.fromObject(list));	
		request.setAttribute("startPageNum", startPageNum);	
		request.setAttribute("endPageNum", endPageNum);	
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);	
		request.setAttribute("totalRow", totalRow);	
		mView.addObject("list", list);
	}

	@Override
	public void getItemView(ModelAndView mView,int itemNum) {
		Unknown_itemDto dto = dao.itemViewData(itemNum);
		mView.addObject("dto", dto);
	}

	@Override
	public void cateList(int cateCode, int cateLevel , HttpServletRequest request , ModelAndView mView) {
		Unknown_itemDto dto = new Unknown_itemDto();
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
			
			List<Unknown_itemDto> list = dao.cateList1(dto);
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
			
			List<Unknown_itemDto> list = dao.cateList2(dto);
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
	@Override
	public void bestItemList(ModelAndView mView) {
		List<ItemDto> dto = dao.itemBestList();
		List<ItemDto> result = new ArrayList<ItemDto>();
		for(int i = 0; i < 4; i++) {
			result.add(dto.get(i));
		}
		mView.addObject("bestItemList", result);
	}

	@Override
	public void newItemList(ModelAndView mView) {
		List<ItemDto> dto = dao.itemNewList();
		List<ItemDto> result = new ArrayList<ItemDto>();
		for(int i = 0; i < 4; i++) {
			result.add(dto.get(i));
		}
		mView.addObject("newItemList", result);
		
	}

}
