package com.test.project01.cart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.project01.cart.dto.CartListDto;
import com.test.project01.cart.dto.wishlistDto;

@Repository
public class CartDaoImpl implements CartDao{
	@Autowired
	private SqlSession session;

	//추가	
	@Override
	public void addCart(CartListDto dto) {
		session.insert("cart.addCart", dto);
	}
	//리스트
	@Override
	public List<CartListDto> cartList(String userId) {
		return session.selectList("cart.cartList", userId);
	}
	//삭제
	@Override
	public void deleteCart(int cartNum) {
		session.delete("cart.deleteCart", cartNum);
	}
	//수정
	@Override
	public void modifyCart(CartListDto dto) {
		session.update("cart.modifyCart",dto);
	}
	//동일상품 확인
	@Override
	public int countCart(int itemNum, String userId) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("itemNum", itemNum);
		map.put("userId", userId);
		return session.selectOne("cart.countCart",map);
	}
	//수량변경
	@Override
	public void updateCart(CartListDto dto) {
		session.update("cart.updateCart",dto);
	}
	//수량합계
	@Override
	public int sumMoney(String userId) {
		return session.selectOne("cart.sumMoney", userId);
	}
	//전체삭제
	@Override
	public void deleteAll(String userId) {
		session.delete("cart.deleteAll",userId);

	}

	
	@Override
	public void addWish(wishlistDto dto) {
		session.insert("cart.addWish", dto);
	}
	@Override
	public List<wishlistDto> wishlist(String userId) {
		return session.selectList("cart.wishlist", userId);
	}
	@Override
	public void deleteWish(int wishNum) {
		session.delete("cart.deleteWish", wishNum);
	}
	@Override
	public void insertCart(CartListDto dto) {
		session.insert("cart.insertCart",dto);
	}
	@Override
	public int countWish(int itemNum, String userId) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("itemNum", itemNum);
		map.put("userId", userId);
		return session.selectOne("cart.countWish",map);
	}
	@Override
	public List<wishlistDto> getItem(int itemNum) {
		return session.selectList("cart.getItem", itemNum);
	}		

}
