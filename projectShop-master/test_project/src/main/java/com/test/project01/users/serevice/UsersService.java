package com.test.project01.users.serevice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.users.Dto.UsersDto;

public interface UsersService {

	public Map<String, Object> isExistId(String inputUserId);
	public void addUser(UsersDto dto);
	public boolean validUsers(UsersDto dto, HttpSession session, ModelAndView mView);
	public void showInfo(String id, ModelAndView mView);
	public void deleteUser(String id);
	public boolean findUsersId(UsersDto dto, HttpServletRequest request);
	public boolean newUpdatePass(UsersDto dto, HttpServletRequest request);
	public void changeNewPassData(UsersDto dto,HttpServletRequest request);
	public void updatePass(UsersDto dto, ModelAndView mView);
	public void userUpdate(UsersDto dto);
}
