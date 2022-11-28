package com.test.project01.order.service;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.project01.cart.dao.CartDao;
import com.test.project01.cart.dto.CartListDto;
import com.test.project01.master.category.Dao.categoryDao;

import com.test.project01.order.dao.OrderDao;
import com.test.project01.order.dao.OrderDetailDao;
import com.test.project01.order.dto.OrderDetailDto;
import com.test.project01.order.dto.OrderDetailJoinDto;
import com.test.project01.order.dto.OrdersDto;
import com.test.project01.users.Dto.UsersDto;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderDao dao;
	@Autowired
	OrderDetailDao detailDao;
	@Autowired
	CartDao cartDao;
	@Autowired
	categoryDao categoryDao;

	
	@Override
	public void cartList_insertform(HttpServletRequest request) {

		//장바구니에 담긴 리스트
		UsersDto userDto=(UsersDto)request.getSession().getAttribute("userDto");
		String userId=userDto.getUserId();
		List<CartListDto> list=cartDao.cartList(userId);
		request.setAttribute("list", list);
		request.setAttribute("userAddr2", userDto.getUserAddr2());
		System.out.println(userDto.getUserAddr2());

	}	
	
	@Transactional
	@Override
	public void insert(HttpServletRequest request, OrdersDto dto) {
		//주문 정보 저장
		UsersDto userDto=(UsersDto)request.getSession().getAttribute("userDto");
		String userId=userDto.getUserId();
		String orderRec=request.getParameter("orderRec");
		String orderPhone1=request.getParameter("orderPhone1");
		String orderPhone2=request.getParameter("orderPhone2");
		String userAddr1=request.getParameter("userAddr1");
		String userAddr2=request.getParameter("userAddr2");
		String userAddr3=request.getParameter("userAddr3");
		String msg=request.getParameter("msg");
		String payment=request.getParameter("payment");
		int allPrice=Integer.parseInt(request.getParameter("allPrice"));
		dto.setUserId(userId);
		dto.setOrderRec(orderRec);
		dto.setOrderPhone1(orderPhone1);
		dto.setOrderPhone2(orderPhone2);
		dto.setUserAddr1(userAddr1);
		dto.setUserAddr2(userAddr2);
		dto.setUserAddr3(userAddr3);
		dto.setMsg(msg);
		dto.setPayment(payment);
		dto.setAllPrice(allPrice);
		dao.insert(dto);
		
//		List<OrdersDto> getOrderNum=dao.getOrderNum(userId);
		List<Integer> getOrderNum=dao.getOrderNum(userId);
		int size=getOrderNum.size()-1;
//		int orderNum=getOrderNum.get(size).getOrderNum();
		int orderNum=getOrderNum.get(size);
		//주문 디테일 추가
		List<CartListDto> list=cartDao.cartList(userId);
		
		for(int i=0;i<list.size();i++) {
			int itemNum=list.get(i).getItemNum();
			int quantity=list.get(i).getCartStock();
			OrderDetailDto detailDto=new OrderDetailDto();
			detailDto.setOrderNum(orderNum);
			detailDto.setItemNum(itemNum);
			detailDto.setQuantity(quantity);
			//주문 상세내역의 아이템 정보 입력
			detailDao.detailInsert(detailDto);
			//해당 아이템의 재고량 줄이기
			categoryDao.minusCount(detailDto);
			System.out.println(itemNum);
			dao.itemGetCount(itemNum);
		}
		//해당 아이디의 장바구니 삭제하기
		cartDao.deleteAll(userId);
	}
	//구매내역조회
	@Override
	public void orderList(HttpServletRequest request) {
		UsersDto userDto=(UsersDto)request.getSession().getAttribute("userDto");
		String userId=userDto.getUserId();
		List<Integer> getOrderNum=dao.getOrderNum2(userId);
		OrderDetailJoinDto joinDto=new OrderDetailJoinDto();
		List<OrderDetailJoinDto> orderList=new ArrayList<>();
		//해당 주문번호에 대한 반복문 돌기
		for(int i=0;i<getOrderNum.size();i++) {
			//주문번호의 값 얻기
			int orderNum=getOrderNum.get(i);
			//OrderDetailjoinDto에 정보 넣기
			joinDto.setUserId(userId);
			joinDto.setOrderNum(orderNum);
			//정보넣은 값의 첫번째 Dto를 얻어오기
			OrderDetailJoinDto joinDto2=detailDao.getList(joinDto).get(0);
			//해당 주문번호의 디테일 상품들의 리스트의 크기 얻기 ( 외 n 건 을 만들기 위해)
			int size=detailDao.getList(joinDto).size()-1;
			
			if(size>0) {  //만약 size()-1 한 값이 0보다 크면
				joinDto2.setItemName(joinDto2.getItemName()+" 외 "+size+" 건");
			}else{  // 0보다 크지않으면
				joinDto2.setItemName(joinDto2.getItemName());
			}
			orderList.add(joinDto2);  //해당 주문번호의 디테일의 값을  List에 추가하기
		}
		request.setAttribute("orderList", orderList);
		
	}

	@Override
	public void orderInfo(HttpServletRequest request) {
		//해당 주문번호의 정보
		UsersDto userDto=(UsersDto)request.getSession().getAttribute("userDto");
		String userId=userDto.getUserId();
		int orderNum=Integer.parseInt(request.getParameter("orderNum"));
		OrdersDto dto=new OrdersDto();
		dto.setUserId(userId);
		dto.setOrderNum(orderNum);
		List<OrdersDto> list=dao.orderInfo(dto);
		request.setAttribute("list", list);
		//해당 주문번호의 아이템들
		OrderDetailJoinDto joinDto=new OrderDetailJoinDto();
		joinDto.setUserId(userId);
		joinDto.setOrderNum(orderNum);
		List<OrderDetailJoinDto> list2=detailDao.getList(joinDto);
		request.setAttribute("list2", list2);
	}

	@Override
	public void delivery(HttpServletRequest request) {
		//해당 주문번호의 배달정보
		UsersDto userDto=(UsersDto)request.getSession().getAttribute("userDto");
		String userId=userDto.getUserId();
		int orderNum=Integer.parseInt(request.getParameter("orderNum"));
		OrdersDto dto=new OrdersDto();
		dto.setUserId(userId);
		dto.setOrderNum(orderNum);
		List<OrdersDto> list=dao.orderInfo(dto);
		request.setAttribute("list", list);
	}
}
 