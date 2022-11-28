package com.test.project01.review.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.test.project01.review.dto.ReviewCommentDto;
import com.test.project01.review.dto.ReviewDto;
import com.test.project01.review.dto.ReviewUpCountDto;

public interface ReviewService {
	// 전체 리뷰
	public void list(HttpServletRequest request);

	// 해당 아이템의 리뷰
	public void list2(HttpServletRequest request);

	// 리뷰 등록 폼에 전달
	public void insertform(HttpServletRequest request);

	// 리뷰 등록
	public void insert(HttpServletRequest request, ReviewDto dto);

	// 리뷰 데이터
	public void getReviewData(HttpServletRequest request);

	// 리뷰 업데이트 할 때 보여주는 데이터
	public void getUpdateData(ModelAndView mView, int reviewNum);

	// 리뷰 업데이트
	public void update(HttpServletRequest request, ReviewDto dto);

	// 리뷰 삭제
	public void delete(HttpServletRequest request, int reviewNum);

	// 리뷰 댓글 삭제
	public void deleteComment(int num);

	// 리뷰 댓글 등록
	public void saveComment(HttpServletRequest request);

	// 리뷰 댓글 수정
	public void updateComment(ReviewCommentDto dto);

	// 리뷰 좋아요
	public Map<String, Object> addUpCount(HttpServletRequest request, ReviewUpCountDto dto);

	// 리뷰 존재여부
	public boolean isExist(HttpServletRequest request, int itemNum);

	// board_list에서 내가쓴 리뷰 목록
	public void reviewList(HttpServletRequest request);

}
