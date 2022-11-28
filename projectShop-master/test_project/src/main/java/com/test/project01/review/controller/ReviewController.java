package com.test.project01.review.controller;

import java.util.HashMap;
import java.util.List;
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

import com.test.project01.qna.service.QnaService;
import com.test.project01.review.dto.ReviewCommentDto;
import com.test.project01.review.dto.ReviewDto;
import com.test.project01.review.dto.ReviewUpCountDto;
import com.test.project01.review.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	ReviewService service;
	@Autowired
	QnaService qnaService;
	
	//리뷰 목록보기
	@RequestMapping("/review/list")
	public ModelAndView getList(HttpServletRequest request,ModelAndView mView) {
		service.list(request);
		mView.setViewName("review/list");
		return mView;
	}
	
	//리뷰 목록보기 (상품 디테일에서)
	@RequestMapping("/review/itemList_review")
	public ModelAndView getList2(HttpServletRequest request,ModelAndView mView) {
		service.list2(request);
		mView.setViewName("review/itemList_review");
		return mView;
	}
	//리뷰 인서트폼
	@RequestMapping("/review/insertform")
	public ModelAndView Users_Insertform(HttpServletRequest request) {
		service.insertform(request);
		return new ModelAndView("review/insertform");	
	}
	
	//리뷰 insert
	@RequestMapping(value="/review/insert", method= RequestMethod.POST)
	public ModelAndView Users_Insert(HttpServletRequest request,
			ModelAndView mView,@ModelAttribute ("dto") ReviewDto dto,@RequestParam int itemNum) {
		boolean isExist=service.isExist(request, itemNum);
		request.setAttribute("isExist", isExist);
		System.out.println(isExist);
		service.insert(request, dto);
		return new ModelAndView("redirect:list.do");
//		return new ModelAndView("redirect:itemList_review.do?itemNum="+itemNum) ;
	}
	
	//디테일
	@RequestMapping("/review/detail")
	public ModelAndView Users_detail(ModelAndView mView,HttpServletRequest request) {
		service.getReviewData(request);
		mView.setViewName("review/detail");
		return mView;
	}
	
	//업데이트 폼
	@RequestMapping(value="/review/updateform",method=RequestMethod.GET)
	public ModelAndView Users_Updateform(HttpServletRequest request,ModelAndView mView,@RequestParam int reviewNum,@RequestParam int itemNum) {
		service.getUpdateData(mView,reviewNum);
		mView.setViewName("review/updateform");
		return mView;
	}
	
	//업데이트
	@RequestMapping(value="/review/update" ,method=RequestMethod.POST)
	public ModelAndView Users_Update(HttpServletRequest request,ModelAndView mView,@ModelAttribute("dto") ReviewDto dto) {
		service.update(request, dto);
		mView.setViewName("review/update");
		return mView;
	}
	
	//삭제
	@RequestMapping("/review/delete")
	public ModelAndView Users_Delete(HttpServletRequest request,@RequestParam int reviewNum,@RequestParam int itemNum) {
		service.delete(request, reviewNum);
		return new ModelAndView("redirect:list.do?itemNum="+itemNum);
	}
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value="/review/comment_delete",method=RequestMethod.POST )
	public Map<String, Object> authCommentDelete(HttpServletRequest request,
			@RequestParam int num){
		
		service.deleteComment(num);
		
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map; 
	}
	//댓글등록
	@RequestMapping(value="/review/comment_insert",method = RequestMethod.POST)
	public ModelAndView Users_authCommentInsert(HttpServletRequest request,
			@RequestParam int ref_group) {
		service.saveComment(request);
		return new ModelAndView("redirect:/review/detail.do?reviewNum="+ref_group);
	}
	//댓글 수정
	@ResponseBody
	@RequestMapping("/review/comment_update")
	public Map<String, Object> authCommentUpdate(HttpServletRequest request,
				@ModelAttribute ReviewCommentDto dto){

		service.updateComment(dto);

		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}

	//리뷰 좋아요 처리
	@ResponseBody
	@RequestMapping(value = "/review/reviewUpCount", method = RequestMethod.POST)
	public Map<String, Object> Users_authAddUpCount(HttpServletRequest request,
			@ModelAttribute("dto") ReviewUpCountDto dto,@RequestParam(value="arrEachItemNum[]")List<Integer> eachItemNum) {
		dto.setItemNum(eachItemNum.get(0));
		dto.setReviewNum(eachItemNum.get(1));
		Map<String,Object> map=service.addUpCount(request,dto);
	
		return map;
	}


	//board_list 에서 qna목록, review 목록
	@RequestMapping("/Users/boardList")
	public ModelAndView User_boardList(HttpServletRequest request,ModelAndView mView) {
		service.reviewList(request);
		qnaService.qnalist(request);
		mView.setViewName("Users/boardList");
		return mView;
	}
	
}
