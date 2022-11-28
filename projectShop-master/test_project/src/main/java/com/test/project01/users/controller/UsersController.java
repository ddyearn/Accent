package com.test.project01.users.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.users.Dto.UsersDto;
import com.test.project01.users.serevice.UsersService;

@Controller
public class UsersController {
	@Autowired
	private UsersService service;
	@RequestMapping("/Users/signup_form")
	public String signup_form() {
		return "Users/signup_form";
	}
	
	//마이페이지 이동
	@RequestMapping("/Users/myPage")
	public String myPage() {
		return "Users/myPage";
	}
	
	@ResponseBody
	@RequestMapping(value = "/Users/checkId", method = RequestMethod.POST)
	public Map<String, Object> checkid(@RequestParam String inputId){
		Map<String, Object> map=service.isExistId(inputId);
		return map;
	}
	
	@RequestMapping(value="/Users/signup", method = RequestMethod.POST)
	public ModelAndView signup(@ModelAttribute("dto") UsersDto dto, 
			ModelAndView mView) {
		service.addUser(dto);
//		mView.setViewName("index");
		return new ModelAndView("Users/login_form");
	}
	// 로그인
	@RequestMapping("Users/login_form")
	public String logInForm(HttpServletRequest request) {	
		return "Users/login_form";
	}
	
	@ResponseBody
	@RequestMapping(value ="/Users/login", method = RequestMethod.POST)
	public Map<String, Object> logIn(@ModelAttribute UsersDto dto,
			ModelAndView mView, HttpServletRequest request, 
			HttpServletResponse response) {
		boolean test=service.validUsers(dto, request.getSession(), mView);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", test);
		return map;
//		if(test) {
//			mView.setViewName("index");
//			return mView;
//		} else {
//			mView.setViewName("Users/login_form");
//			return mView;
//		}
	}

	//로그아웃
	@RequestMapping("Users/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index.do";
	}
	// 개인 정보 보기 요청 처리
	@RequestMapping("Users/info")
	public ModelAndView Users_authInfo(HttpServletRequest request, 
				ModelAndView mView) {
		//로그인된 아이디 읽어오기
		String id=(String)request.getSession().getAttribute("id");
			
		//UsersService 객체를 이용해서 개인정보를 ModelAndView 객체에 담기도록 한다.
		service.showInfo(id, mView);
		//view page 정보를 담고 
		mView.setViewName("Users/info");
		return mView;//ModelAndView 객체를 리턴해주기 
	}
		
		
	// 비밀번호 수정하고 폼 요청 처리
	@RequestMapping("/Users/newPassform")
	public ModelAndView Users_passForm(HttpServletRequest request, 
			ModelAndView mView) {
		mView.setViewName("Users/newPassform");
		return mView;
	}
		
	@RequestMapping(value="/Users/newPass", method=RequestMethod.POST)
	public ModelAndView Users_passUpdate(HttpServletRequest request,
			ModelAndView mView,HttpSession session,@ModelAttribute UsersDto dto) {
			
		UsersDto test=(UsersDto)session.getAttribute("userDto");
		dto.setUserId(test.getUserId());
		service.updatePass(dto, mView);
			
		mView.setViewName("/Users/newPassform");
		return mView;
	}
	// 개인정보 수정 폼 요청
	@RequestMapping("Users/updateform")
	public ModelAndView Users_updateForm(HttpServletRequest request,
			ModelAndView mView) {
			
		String id=(String)request.getSession().getAttribute("id");
		service.showInfo(id, mView);
		mView.setViewName("Users/updateform");
		return mView;	
	}
		
	@RequestMapping(value="Users/update", method = RequestMethod.POST)
	public String update(@ModelAttribute UsersDto dto) {
		service.userUpdate(dto);
		return "redirect:/Users/info.do";
	}
		
	// 회원탈퇴
	@RequestMapping("Users/delete")
	public ModelAndView Users_delete(HttpServletRequest request,
			ModelAndView mView) {
		HttpSession session = request.getSession();
		String id=(String) session.getAttribute("id");
		// 회원 정보 삭제
		service.deleteUser(id);
		//로그아웃 처리
		session.invalidate();
		mView.addObject("id", id);
		mView.setViewName("Users/delete");
		return mView;
	}
	
	// 아이디, 비밀번호 찾기
	// 첫 화면(아이디 찾기 (정보 입력란))
	@RequestMapping("Users/searchIdForm")
	public ModelAndView find(HttpServletRequest request, ModelAndView mView) {
		mView.setViewName("Users/searchIdForm");
		return mView;
	}
	
	@RequestMapping("Users/PassAndLogin")
	public ModelAndView idAndlogin(@ModelAttribute UsersDto dto, HttpServletRequest request, ModelAndView mView) {
		service.findUsersId(dto, request);
		mView.setViewName("Users/PassAndLogin");
		return mView;
	}
	@RequestMapping("Users/searchPassForm")
	public ModelAndView searchPassForm() {
		return new ModelAndView("/Users/searchPassForm");
	}
	
	// 입력한 정보의 값에 따라 true & false 로 나눠서 경로로 이동 
	@RequestMapping(value="Users/searchPass", method = RequestMethod.POST)
	public ModelAndView findId(@ModelAttribute UsersDto dto, HttpServletRequest request,ModelAndView mView) {		
		if(service.newUpdatePass(dto, request)) {
			request.setAttribute("check", "true");
			mView.setViewName("Users/searchnewPass");
			return mView;
		}else { // false 일 때,
			mView.setViewName("Users/searchPassForm");
			request.setAttribute("check", "false");
			return mView;
		}
		
	}
	
	// 입력한 정보가 true 이면, 찾으려는 아이디를 직접 보여주면서, 비밀번호 찾기 정보 입력.
	@RequestMapping("Users/searchnewPass")
	public ModelAndView newPassFind(HttpServletRequest request, ModelAndView mView,
					@ModelAttribute UsersDto dto) {
		boolean test=service.newUpdatePass(dto, request);
		
		if(test) {
			request.setAttribute("dto", dto);
			mView.setViewName("Users/searchnewPass");
			return mView;
		} else {
			mView.setViewName("Users/searchPassForm");
			request.setAttribute("check", "false");
			return mView;
		}
	}
	// 비밀번호 찾기 질문이 전부 true일 때, 비밀번호 수정 ... 수정 후, 바로 로그인 창으로 고고!
	@RequestMapping(value="/Users/changeNewPassData", method = RequestMethod.POST)
	public ModelAndView searchnewPass(@ModelAttribute UsersDto dto,HttpServletRequest request) {
		service.changeNewPassData(dto,request);
		return new ModelAndView("Users/login_form");
	}
}
