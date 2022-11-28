package com.test.project01.users.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.project01.users.Dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert", dto);
	}
	
	@Override
	public boolean isExist(String userId) {
		String id = session.selectOne("users.isExist", userId);
		
		if(id == null) {
			return false;			
		} else {
			return true;
		}
	}
	
	@Override
	public String getPassHash(String userId) {
		String savePwd = session.selectOne("users.getPassHash", userId);
		return savePwd;
	}

	@Override
	public UsersDto logIn(String inputUserId) {
		return session.selectOne("users.login", inputUserId);
	}

	@Override
	public UsersDto getData(String id) {
		return session.selectOne("users.getData", id);
	}

	@Override
	public void update(UsersDto dto) {
		session.update("users.updateUser", dto);	
	}
	@Override
	public void updatePass(UsersDto dto) {
		session.update("users.updatePwd", dto);
	}
	
	@Override
	public void delete(String id) {
		session.delete("users.delete", id);
	}
	
	// 아이디 찾기
	@Override
	public String findId(UsersDto dto) {
		String find = session.selectOne("users.findId", dto);
		return find;
	}
	// 비밀번호 찾기	
	@Override
	public String findPass(UsersDto dto) {
		String find = session.selectOne("users.findPass", dto);
		return find;
	}

	// 재수정
	@Override
	public String newpass(UsersDto dto) {
		String newpass = session.selectOne("users.findPass", dto);
		return newpass;
	}
	@Override
	public void changeNewPassData(UsersDto dto) {
		session.update("users.changeNewPassData",dto);
		
	}
}
