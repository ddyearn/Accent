package com.test.project01.unknown.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.project01.master.category.Dto.ItemDto;
import com.test.project01.unknown.Dto.Unknown_itemDto;

@Repository
public class Unknown_DaoImpl implements Unknown_Dao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Unknown_itemDto> itemList(Unknown_itemDto dto) {
		List<Unknown_itemDto> list = session.selectList("unknown.itemSelect" , dto);
		return list;
	}
	
	@Override
	public int itemListCount() {
		List<Unknown_itemDto> list = session.selectList("unknown.itemSelect_Count");
		int count = list.size();
		return count;
	}

	@Override
	public Unknown_itemDto itemViewData(int itemNum) {
		return session.selectOne("unknown.itemViewContent", itemNum);
	}

	@Override
	public List<Unknown_itemDto> cateList1(Unknown_itemDto dto) {
		List<Unknown_itemDto> list = session.selectList("unknown.cateList1", dto);
		return list;
	}
	
	@Override
	public int cateList1_Count(int cateCode, int cateCodeRef) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cateCode", String.valueOf(cateCode));
		map.put("cateCodeRef", String.valueOf(cateCodeRef));	
		List<Unknown_itemDto> list = session.selectList("unknown.cateList1_Count" , map);
		return list.size();
	}

	@Override
	public List<Unknown_itemDto> cateList2(Unknown_itemDto dto) {
		List<Unknown_itemDto> list = session.selectList("unknown.cateList2", dto);
		return list;
	}

	@Override
	public int cateList2_Count(int cateCode) {	
		List<Unknown_itemDto> list = session.selectList("unknown.cateList2_Count" , cateCode);
		return list.size();
	}

	
	@Override
	public List<ItemDto> itemBestList() {
		List<ItemDto> dto = session.selectList("category.bestItemList");
		return dto;
	}

	@Override
	public List<ItemDto> itemNewList() {
		List<ItemDto> dto = session.selectList("category.newItemLsit");
		return dto;
	}




	
}
