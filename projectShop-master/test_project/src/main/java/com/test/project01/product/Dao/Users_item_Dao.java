package com.test.project01.users_item.Dao;

import java.util.List;

import com.test.project01.unknown.Dto.Unknown_itemDto;
import com.test.project01.users_item.Dto.Users_item_Dto;

public interface Users_item_Dao {
	public List<Users_item_Dto> itemList(Users_item_Dto dto);
	public int itemList_Count();
	public Users_item_Dto itemViewData(int itemNum);
	public List<Users_item_Dto> cateList1(Users_item_Dto dto);
	public int cateList1_Count(int cateCode, int cateCpdeRef);
	public List<Users_item_Dto> cateList2(Users_item_Dto dto);
	public int cateList2_Count(int cateCode);
}
