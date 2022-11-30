package com.test.project01.users_item.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.project01.users_item.Dto.Users_item_Dto;

@Repository
public class Users_item_DaoImpl implements Users_item_Dao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Users_item_Dto> itemList(Users_item_Dto dto) {
		List<Users_item_Dto> list = session.selectList("Users_item.itemSelect", dto);
		return list;
	}
	
	@Override
	public int itemList_Count() {
		List<Users_item_Dto> list = session.selectList("Users_item.itemSelect_Count");
		return list.size();
	}
	
	@Override
	public Users_item_Dto itemViewData(int itemNum) {
		return session.selectOne("Users_item.itemViewContent", itemNum);
	}

	@Override
	public List<Users_item_Dto> cateList1(Users_item_Dto dto) {
		List<Users_item_Dto> list = session.selectList("Users_item.cateList", dto);
		return list;
	}
		
	@Override
	public int cateList1_Count(int cateCode, int cateCpdeRef) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cateCode", String.valueOf(cateCode));
		map.put("cateCodeRef", String.valueOf(cateCpdeRef));
		List<Users_item_Dto> list = session.selectList("Users_item.cateList_Count" , map);
		return list.size();
	}

	@Override
	public List<Users_item_Dto> cateList2(Users_item_Dto dto) {
		List<Users_item_Dto> list = session.selectList("Users_item.cateList2", dto);
		return list;
	}
	
	public int cateList2_Count(int cateCode) {
		List<Users_item_Dto> list = session.selectList("Users_item.cateList2_Count" , cateCode);
		return list.size();
	}


	
	
}
