package com.test.project01.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.project01.review.dto.ReviewCommentDto;

@Repository
public class ReviewCommentDaoImpl implements ReviewCommentDao {
	@Autowired
	SqlSession session;

	@Override
	public List<ReviewCommentDto> getList(int ref_group) {
		return session.selectList("reviewComment.getList",ref_group);
	}

	@Override
	public void delete(int num) {
		session.update("reviewComment.delete",num);
		
	}

	@Override
	public void insert(ReviewCommentDto dto) {
		session.insert("reviewComment.insert",dto);
	}

	@Override
	public int getSequence() {
		int seq=session.selectOne("reviewComment.getSequence");
		return seq;
	}

	@Override
	public void update(ReviewCommentDto dto) {
		session.update("reviewComment.update",dto);
	}
	
}
