package com.test.project01.cart.service;

import java.util.List;

import com.test.project01.cart.dto.CartListDto;
import com.test.project01.cart.dto.wishlistDto;

public interface CartService {
	//장바구니 추가
	public void addCart(CartListDto dto);
	//장바구니 목록
	public List<CartListDto> cartList(String userId);
	//장바구니 삭제
	public void deleteCart(int cartNum);
	//장바구니 수정
	public void modifyCart(CartListDto dto);
	//장바구니 상품 확인
	public int countCart(int itemNum, String userId);
	//장바구니 상품 수량 변경
	public void updateCart(CartListDto dto);
	//장바구니 금액 합계
	public int sumMoney(String userId);
	
	//위시리스트 추가
	public void addWish(wishlistDto dto);
	//위시리스트 목록
	public List<wishlistDto> wishlist(String userId);
	//위시리스트 삭제
	public void deleteWish(int wishNum);
	//위시리스트에서 장바구니로 추가
	public void insertCart(CartListDto dto);
	//위시리스트 동일 상품 확인
	public int countWish(int itemNum, String userId);

	//위시리스트 카트에 담기
	public void wishList_addCart(String userId);
}
