package com.test.project01.qna.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.test.project01.qna.dto.QnaCommentDto;
import com.test.project01.qna.dto.QnaDto;

public interface QnaService {
	public void getList(HttpServletRequest request);
	public void getList2(HttpServletRequest request,String itemNum);
	public void saveContent(QnaDto dto);
	public void getDetail(HttpServletRequest request);
	public void deleteContent(int num, HttpServletRequest request);
	//원글 수정폼 출력에 필요한 메소드 
	public void getUpdateData(ModelAndView mView, int num);
	//원글 수정하는 메소드 
	public void updateContent(QnaDto dto);	
	//댓글 저장하는 메소드
	public void saveComment(HttpServletRequest request);
	//댓글 삭제하는 메소드
	public void deleteComment(int num);
	//댓글 수정하는 메소드
	public void updateComment(QnaCommentDto dto);
	//해당아이디가 작성한 Q&A 리스트
	public void qnalist(HttpServletRequest request);
	
	public void getItemDetail(HttpServletRequest request);
}
