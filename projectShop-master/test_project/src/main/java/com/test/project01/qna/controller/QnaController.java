package com.test.project01.qna.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.qna.dto.QnaCommentDto;
import com.test.project01.qna.dto.QnaDto;
import com.test.project01.qna.service.QnaService;


@Controller
public class QnaController {
	@Autowired
	private QnaService service;
	
	//글목록 요청처리
	@RequestMapping("/qna/list")
	public ModelAndView list(HttpServletRequest request ){
		// HttpServletRequest 객체를 서비스에 넘겨 주면서
		// 비즈니스 로직을 수행하고 
		service.getList(request);
		
		// view page 로 forward 이동해서 글 목록 출력하기 
		return new ModelAndView("qna/list");
	}
	
	//리뷰 목록보기 (상품 디테일에서)
	@RequestMapping("/qna/itemList_qna")
	public ModelAndView getList2(HttpServletRequest request,ModelAndView mView,@RequestParam String itemNum) {
		service.getList2(request,itemNum);
		request.setAttribute("itemNum", itemNum);
		mView.setViewName("qna/itemList_qna");
		return mView;
	}
	
	//새글 추가 폼 요청 처리
	@RequestMapping("/qna/insertform")
	public ModelAndView Users_authInsertform
			(HttpServletRequest request,@RequestParam String itemNum){
		
		request.setAttribute("itemNum", itemNum);
		return new ModelAndView("qna/insertform");
	}
	
	//새글 추가 요청 처리
	@RequestMapping(value="/qna/insert", method=RequestMethod.POST)
	public ModelAndView Users_authInsert(HttpServletRequest request,
			@ModelAttribute QnaDto dto){
		//세션에 있는 글작성자의 아이디
		String writer=(String)
				request.getSession().getAttribute("id");
		//CafeDto 객체에 담고 
		dto.setWriter(writer);
		//서비스를 이용해서 DB 에 저장
		service.saveContent(dto);
		//글 목록 보기로 리다일렉트 이동 
		return new ModelAndView("redirect:/Users_Item/itemView_form.do?itemNum="+dto.getItemNum()+"&pageNum=1&reviewNum=1");
	}
	//글 자세히 보기 요청 처리
	@RequestMapping("/qna/detail")
	public String detail(HttpServletRequest request,@RequestParam int itemNum){
		service.getDetail(request);
		request.setAttribute("itemNum", itemNum);
		//view page 로 forward 이동해서 글 자세히 보기 
		return "qna/detail";
	}
	//원글 삭제 요청 처리
	@RequestMapping("/qna/delete")
	public ModelAndView Users_authDelete(HttpServletRequest request,
				@RequestParam int num){
		//서비스를 이용해서 글을 삭제하기 
		service.deleteContent(num, request);
		//글 목록 보기로 리다일렉트 이동 
		return new ModelAndView("redirect:/qna/list.do");
	}
	@RequestMapping("/qna/updateform")
	public ModelAndView Users_authUpdateform(HttpServletRequest request, 
			@RequestParam int num,@RequestParam int itemNum,
			ModelAndView mView){
		//서비스를 이용해서 수정할 글정보를 ModelAndView
		//객체에 담고
		service.getUpdateData(mView, num);
		request.setAttribute("itemNum", itemNum);
		//view page 로 forward 이동해서 수정폼 출력
		mView.setViewName("qna/updateform");
		return mView;
	}
	
	//원글 수정 반영 요청 처리
	@RequestMapping(value="/qna/update",
			method=RequestMethod.POST)
	public ModelAndView Users_authUpdate(HttpServletRequest request,
				@ModelAttribute QnaDto dto){
		//서비스를 이용해서 수정 반영한다.
		service.updateContent(dto);
		//글 자세히 보기로 리다일렉트 이동 
		return new ModelAndView
			("redirect:/qna/detail.do?num="+dto.getNum()+"&itemNum="+dto.getItemNum()+"&pageNum=1");
	}
	
	//댓글 저장 요청 처리
	@RequestMapping(value = "/qna/comment_insert", 
			method = RequestMethod.POST)
	public ModelAndView authCommentInsert(HttpServletRequest request,
			@RequestParam int ref_group,@RequestParam int itemNum) {
		service.saveComment(request);
		request.setAttribute("itemNum", itemNum);
		return new ModelAndView("redirect:/qna/detail.do?num="+ref_group+"&"+"itemNum="+itemNum);
	}
	
	//댓글 삭제 요청 처리
	@ResponseBody
	@RequestMapping(value = "/qna/comment_delete", method = RequestMethod.POST)
	public Map<String, Object> authCommentDelete(HttpServletRequest request,
			@RequestParam int num){
		service.deleteComment(num);
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map; // {"isSuccess":true} 형식의 JSON 문자열이 응답된다.
	}
	//댓글 수정 요청 처리(ajax)
	@ResponseBody
	@RequestMapping("/qna/comment_update")
	public Map<String, Object> authCommentUpdate(HttpServletRequest request,
			@ModelAttribute QnaCommentDto dto){
		service.updateComment(dto);
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}
	@RequestMapping("/qna/itemDetail")
	public String itemDetail(HttpServletRequest request,@RequestParam int itemNum){
		service.getItemDetail(request);
		request.setAttribute("itemNum", itemNum);
		//view page 로 forward 이동해서 글 자세히 보기 
		return "qna/itemDetail";
	}
}
