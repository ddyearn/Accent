package com.test.project01.unknown.Dao;

import java.util.List;

import com.test.project01.master.category.Dto.ItemDto;
import com.test.project01.unknown.Dto.Unknown_itemDto;

public interface Unknown_Dao {
	public List<Unknown_itemDto> itemList(Unknown_itemDto dto);
	public int itemListCount();
	public Unknown_itemDto itemViewData(int itemNum);
	public List<Unknown_itemDto> cateList1(Unknown_itemDto dto);
	public int cateList1_Count(int cateCode, int cateCodeRef);
	public List<Unknown_itemDto> cateList2(Unknown_itemDto dto);
	public int cateList2_Count(int cateCode);
	public List<ItemDto> itemBestList();
	public List<ItemDto> itemNewList();
}
