package com.test.project01.master.category.serevice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.master.category.Dao.categoryDao;
import com.test.project01.master.category.Dto.ItemDto;
import com.test.project01.master.category.Dto.ItemViewDto;
import com.test.project01.master.category.Dto.Orders_Dto;
import com.test.project01.master.category.Dto.categoryDto;
import com.test.project01.order.dto.OrdersDto;
import com.test.project01.users.Dto.UsersDto;

import net.sf.json.JSONArray;

@Service
public class categoryServicelmpl implements categoryService {

	@Autowired
	private categoryDao dao;
	static final int PAGE_ROW_COUNT = 10;
	static final int PAGE_DISPLAY_COUNT = 5;	
	
	@Override
	public void categoryList(ModelAndView mView) {
		List<categoryDto> list = dao.categoryList();
		mView.addObject("list",JSONArray.fromObject(list));
	}

	@Override
	public void itemInsert(ItemDto dto) {
		dao.itemInsert(dto);
	}

	@Override
	public void itemList(ModelAndView mView , HttpServletRequest request) {
		ItemDto dto = new ItemDto();
		int pageNum = 1;
		String strPageNum = request.getParameter("pageNum");
		if(strPageNum != null) {
			pageNum = Integer.parseInt(strPageNum);
		}
		int startRowNum = 1+(pageNum - 1)*PAGE_ROW_COUNT;
		int endRowNum = pageNum*PAGE_ROW_COUNT;
		
		int totalRow = dao.getItemListCount();
		int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		int startPageNum = 1+((pageNum - 1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
		if(totalPageCount < endPageNum) {
			endPageNum = totalPageCount;
		}
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		List<ItemDto> list = dao.itemList(dto);
		mView.addObject("list", JSONArray.fromObject(list));	
		request.setAttribute("startPageNum", startPageNum);	
		request.setAttribute("endPageNum", endPageNum);	
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);	
		request.setAttribute("totalRow", totalRow);	
	}
	@Override
	public void getItemView(ModelAndView mView,int itemNum) {
		ItemDto dto = dao.itemViewData(itemNum);
		mView.addObject("dto", dto);
	}

	@Override
	public void getItemViewList(ModelAndView mView, int itemNum) {
		ItemViewDto dto = dao.itemViewList(itemNum);
		mView.addObject("dto", dto);
		List<categoryDto> list = dao.categoryList();
		mView.addObject("list",JSONArray.fromObject(list));			
	}

	@Override
	public void getItemUpdateDate(ItemDto dto) {
		dao.ItemUpdate(dto);	
	}

	@Override
	public void itemDelete(int itemNum, HttpServletRequest request) {
		dao.ItemDelete(itemNum);
	}

	@Override
	public void upResult(OrdersDto Dto) {
		dao.upResult(Dto);
	}
	
	@Override
	public void OrderList(ModelAndView mView, HttpServletRequest request) {
		Orders_Dto dto = new Orders_Dto();
		int pageNum = 1;
		String strPageNum = request.getParameter("pageNum");
		if(strPageNum != null) {
			pageNum = Integer.parseInt(strPageNum);
		}
		int startRowNum = 1+(pageNum - 1)*PAGE_ROW_COUNT;
		int endRowNum = pageNum*PAGE_ROW_COUNT;
		
		int totalRow = dao.getOrderListCount();
		int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		int startPageNum = 1+((pageNum - 1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
		if(totalPageCount < endPageNum) {
			endPageNum = totalPageCount;
		}
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		List<Orders_Dto> list = dao.orderList(dto);
		mView.addObject("orderList", JSONArray.fromObject(list));	
		request.setAttribute("startPageNum", startPageNum);	
		request.setAttribute("endPageNum", endPageNum);	
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);	
		request.setAttribute("totalRow", totalRow);	
	}

	@Override
	public void getUserAllList(ModelAndView mView, HttpServletRequest request) {
		UsersDto dto = new UsersDto();
		int pageNum = 1;
		String strPageNum = request.getParameter("pageNum");
		if(strPageNum != null) {
			pageNum = Integer.parseInt(strPageNum);
		}
		int startRowNum = 1+(pageNum - 1)*PAGE_ROW_COUNT;
		int endRowNum = pageNum*PAGE_ROW_COUNT;
		
		int totalRow = dao.getUserAllCount();
		int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		int startPageNum = 1+((pageNum - 1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
		if(totalPageCount < endPageNum) {
			endPageNum = totalPageCount;
		}
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		List<UsersDto> list = dao.userAllList(dto);
		mView.addObject("userAllList", JSONArray.fromObject(list));		
		request.setAttribute("startPageNum", startPageNum);		
		request.setAttribute("endPageNum", endPageNum);		
		request.setAttribute("pageNum", pageNum);		
		request.setAttribute("totalPageCount", totalPageCount);		
		request.setAttribute("totalRow", totalRow);		
	}

	@Override
	public void userVerify(UsersDto userDto) {
		dao.userVerify(userDto);
	}
}
