package com.test.project01.qna.dao;

import java.util.List;

import com.test.project01.qna.dto.QnaCommentDto;
import com.test.project01.qna.dto.QnaJoinDto;

public interface QnaCommentDao {
	public List<QnaCommentDto> getList(int ref_group);
	public void delete(int num);
	public void insert(QnaCommentDto dto);
	public int getSequence();
	public void update(QnaCommentDto dto);
}
