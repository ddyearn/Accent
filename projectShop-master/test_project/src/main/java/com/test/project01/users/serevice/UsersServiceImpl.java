package com.test.project01.users.serevice;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.users.Dao.UsersDao;
import com.test.project01.users.Dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersDao dao;

	// 로긴
	@Override
	public Map<String, Object> isExistId(String inputUserId) {
		boolean isExistId = dao.isExist(inputUserId);
		Map<String, Object> map = new HashMap<>();
		map.put("isExist", isExistId);
		return map;
	}
	
	@Override
	public void addUser(UsersDto dto) {
		// 비밀번호 암호화
		String encodePass = new BCryptPasswordEncoder().encode(dto.getUserPass());
		dto.setUserPass(encodePass);
		dao.insert(dto);
	}
	
	@Override
	public boolean validUsers(UsersDto dto, HttpSession session, ModelAndView mView) {
		boolean isValid = false;
		String passHash = dao.getPassHash(dto.getUserId());
		if (passHash != null) {
			isValid = BCrypt.checkpw(dto.getUserPass(), passHash);
		}
		if (isValid) {
			UsersDto userDto = dao.logIn(dto.getUserId());
			session.setAttribute("userDto", userDto);
			session.setAttribute("id", userDto.getUserId());
			session.setAttribute("verify", userDto.getVerify());
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void showInfo(String id, ModelAndView mView) {
		UsersDto dto = dao.getData(id);	
		mView.addObject("dto", dto);
	}

	@Override
	public void userUpdate(UsersDto dto) {
		dao.update(dto);
	}
	
	@Override
	public void updatePass(UsersDto dto, ModelAndView mView) {
		String PassHash=dao.getData(dto.getUserId()).getUserPass();
		boolean isValid=BCrypt.checkpw(dto.getUserPass(), PassHash);
			
		if(isValid) {
			String encodePass=
					new BCryptPasswordEncoder().encode(dto.getNewPass());
			dto.setNewPass(encodePass);
			dao.updatePass(dto);				
			mView.addObject("isSuccess", true);				
		} 
		else {
			mView.addObject("isSuccess", false);	
		}
	}
	
	@Override
	public void deleteUser(String id) {
		dao.delete(id);
	}
	
	// 아이디 찾기
	@Override
	public boolean findUsersId(UsersDto dto, HttpServletRequest request) {
		String findId = dao.findId(dto);
		
		if(findId != null) {
			
			dto.setUserId(findId);
			request.setAttribute("dto", dto);
			
			return true;
		} 
		else {			
			return false;
		}
	}
	


	@Override
	public boolean newUpdatePass(UsersDto dto, HttpServletRequest request) {
		
		String Id = dao.newpass(dto);	
		if(Id != null) {
			request.setAttribute("check", "true");
			return true;	
		} 
		else {
			request.setAttribute("check", "false");
			return false;
		}		
	}
	// 새로 비밀번호 바꾸기 (로그인x)
	@Override
	public void changeNewPassData(UsersDto dto,HttpServletRequest request) {
		//혜원수정
		//해당 아이디,이름을 불러오기
		String userId=request.getParameter("userId");
		String newPass=request.getParameter("newPass");
		String userPass = new BCryptPasswordEncoder().encode(newPass);
		dto.setUserPass(userPass);
		dto.setUserId(userId);

		dao.changeNewPassData(dto);
		
	}
}
