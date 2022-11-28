package com.test.project01.cart.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.cart.dao.CartDao;
import com.test.project01.cart.dto.CartListDto;
import com.test.project01.cart.dto.wishlistDto;
import com.test.project01.cart.service.CartService;
import com.test.project01.order.dto.OrderDetailDto;
import com.test.project01.users.Dto.UsersDto;

@Controller
public class CartController {
	@Autowired
	private CartService service;
	@Autowired
	CartDao cartDao;
	
	//1. 장바구니 추가
	@RequestMapping(value = "/Users_Item/cart", method = RequestMethod.POST)
	public String Users_addCart(@ModelAttribute("dto") CartListDto dto, HttpSession session) {
		UsersDto user=(UsersDto)session.getAttribute("userDto");
		String userId=user.getUserId();		
		//장바구니에 기존 상품 있나 검사
		int count=service.countCart(dto.getItemNum(), userId);
		if(count == 0) {
			//없으면 추가
			service.addCart(dto);
		}else {
			//있으면 update
			service.updateCart(dto);
		}
		return "redirect:../shop/cartList.do";
	}
	
	//2. 장바구니 목록
	@RequestMapping("/shop/cartList")
	public ModelAndView User_getCartList(HttpSession session, Model model, ModelAndView mView) {
		UsersDto user=(UsersDto)session.getAttribute("userDto");
		String userId=user.getUserId();		
		Map<String, Object> map=new HashMap<String, Object>();
		List<CartListDto> list=service.cartList(userId);
		int sumMoney=service.sumMoney(userId);
		
		int fee=sumMoney>= 50000 ? 0 : 2500;
		map.put("list", list);
		map.put("count", list.size());
		map.put("sumMoney", sumMoney);
		map.put("fee", fee);
		map.put("allPrice", sumMoney+fee);
		map.put("itemCount", list);
		mView.setViewName("shop/cartList");
		mView.addObject("map", map);
		return mView;		
	}
	
	//3. 장바구니 삭제
	@ResponseBody
	@RequestMapping(value="/shop/deleteEachCart", method=RequestMethod.POST)
	public Map<String, Object> Users_deleteEachCart(HttpServletRequest request , @RequestParam(value="arrCheckBox[]")List<String> list) {
		for(int i=0; i<list.size(); i++) {
			service.deleteCart(Integer.parseInt(list.get(i)));
		}
		Map<String,Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}
	
	//4. 장바구니 수정
	@ResponseBody
	@RequestMapping(value="/shop/updateCartStock", method=RequestMethod.POST)
	public Map<String, Object> Users_updateCart(HttpServletRequest request , @RequestParam(value="tarArray[]")List<Integer> dto) {
		CartListDto cartDto=new CartListDto();
		cartDto.setCartNum(dto.get(0));
		cartDto.setCartStock(dto.get(1));
		service.updateCart(cartDto);
		Map<String,Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}
	
	//5. 위시리스트  추가
	@RequestMapping(value = "/Users_Item/addwish", method = RequestMethod.POST)
	public String Users_addWish(@ModelAttribute("dto") wishlistDto dto, HttpSession session) {
		UsersDto user=(UsersDto)session.getAttribute("userDto");
		String userId=user.getUserId();
		//위시리스트에 기존 상품 있나 검사
		int count=service.countWish(dto.getItemNum(), userId);
		if(count ==0) {
			//없으면 추가
			service.addWish(dto);
		}
		return "redirect:../shop/wishlist.do";
	}
	//6. 위시리스트 목록
	@RequestMapping("/shop/wishlist")
	public void Users_getWishList(HttpSession session, Model model) {
		UsersDto user=(UsersDto)session.getAttribute("userDto");
		String userId=user.getUserId();		
		List<wishlistDto> wishlist=service.wishlist(userId);
		model.addAttribute("wishlist", wishlist);
	}
	//7. 위시리스트 삭제
	@RequestMapping("/shop/deleteWish")
	public String Users_deleteWish(@RequestParam int wishNum) {
		service.deleteWish(wishNum);
		return "redirect:wishlist.do";
	}
	//8. 위시리스트에서 장바구니로 추가
	@RequestMapping(value = "shop/insertCart", method = RequestMethod.POST)
	public String Users_insertCart(HttpSession session, @ModelAttribute("dto") CartListDto dto, @RequestParam int wishNum){
		UsersDto user=(UsersDto)session.getAttribute("userDto");
		String userId=user.getUserId();	
		//장바구니에 기존 상품 있나 검사
//		service.wishList_addCart(userId);		
//		int itemNum=Integer.parseInt(request.getParameter("itemNum"));
		
			int count=service.countCart(dto.getItemNum(), userId);
			System.out.println(dto.getItemNum());
			if(count == 0) {	
				service.wishList_addCart(userId);
			}else {
				return "redirect:cartList.do";
				
			}
		service.deleteWish(wishNum);
		return "redirect:cartList.do";
	}
	//바로 주문폼으로 넘어가게 하기
	@RequestMapping(value = "/Users_Item/cart2", method = RequestMethod.POST)
	public String Users_addCart(@ModelAttribute("dto") CartListDto dto, HttpSession session,HttpServletRequest request) {
		UsersDto user=(UsersDto)session.getAttribute("userDto");
		String userId=user.getUserId();		
		//String userId=(String)session.getAttribute("userId");
		//dto.setUserId(userId);
		//장바구니에 기존 상품 있나 검사
		int count=service.countCart(dto.getItemNum(), userId);
		if(count == 0) {
			//없으면 추가
			service.addCart(dto);
		}else {
			//있으면 update
			service.updateCart(dto);
		}
		
		//장바구니에 담긴 리스트
		List<CartListDto> list=cartDao.cartList(userId);
		request.setAttribute("list", list);
		return "redirect:../shop/orderform.do";
	}
}


