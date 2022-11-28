package com.test.project01.users.Dao;

import com.test.project01.users.Dto.UsersDto;

public interface UsersDao {
	// 회원가입, 로그인
	public void insert(UsersDto dto);
	public boolean isExist(String inputUsersId);
	public String getPassHash(String inputUsersId);
	public UsersDto logIn(String usersId);
	public UsersDto getData(String id);
	public void update(UsersDto dto);
	public void updatePass(UsersDto dto);
	public void delete(String id);
	
	// 아이디 찾기
	public String findId(UsersDto dto);
	public String findPass(UsersDto dto);
	public String newpass(UsersDto dto);
	//아이디 찾은 후 비밀번호 변경 
	public void changeNewPassData(UsersDto dto);
}
