package com.test.project01.qna.dao;

import java.util.List;

import com.test.project01.qna.dto.QnaDto;
import com.test.project01.qna.dto.QnaJoinDto;
import com.test.project01.review.dto.ReviewJoinDto;

public interface QnaDao {

	// 글 추가
	public void insert(QnaDto dto);

	// 글 정보 얻어오기
	public QnaDto getData(QnaDto dto);

	// 조회수 증가 시키기
	public void addViewCount(int num);

	// 글 삭제
	public void delete(int num);

	// 글 하나의 정보
	public QnaDto getData(int num);

	// 글 수정
	public void update(QnaDto dto);

	public int getCount(QnaJoinDto dto);

	public List<QnaJoinDto> getList(QnaJoinDto dto);

	public int getCount2(QnaJoinDto dto);

	public List<QnaJoinDto> getList2(QnaJoinDto dto);

	// 해당 아이디가 작성한 Q&A 리스트
	public List<QnaJoinDto> qnaList(String writer);

	public int getCommentCount(int num);
	
	public QnaDto getData3(QnaDto dto);

}
