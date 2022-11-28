package com.test.project01.review.dao;

import java.util.List;

import com.test.project01.review.dto.ReviewCommentDto;

public interface ReviewCommentDao {
	public List<ReviewCommentDto> getList(int ref_group);
	public void delete(int num);
	public void insert(ReviewCommentDto dto);
	public int getSequence();
	public void update(ReviewCommentDto dto);
}
