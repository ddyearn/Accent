package com.test.project01.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.project01.review.dto.ReviewDto;
import com.test.project01.review.dto.ReviewJoinDto;
import com.test.project01.review.dto.ReviewUpCountDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	@Autowired
	SqlSession session;

	@Override
	public List<ReviewJoinDto> getList(ReviewJoinDto dto) {
		return session.selectList("review.getList", dto);
	}

	@Override
	public int getCount(ReviewJoinDto dto) {
		int count = session.selectOne("review.getCount", dto);
		return count;
	}

	@Override
	public int getCount2(ReviewJoinDto dto) {
		int count = session.selectOne("review.getCount2", dto);
		return count;
	}

	@Override
	public List<ReviewJoinDto> getList2(ReviewJoinDto dto) {
		return session.selectList("review.getList2", dto);

	}

	@Override
	public void insert(ReviewDto dto) {
		session.insert("review.insert", dto);
	}

	@Override
	public ReviewDto getData(int reviewNum) {
		return session.selectOne("review.getData", reviewNum);
	}

	@Override
	public void update(ReviewDto dto) {
		session.update("review.update", dto);
	}

	@Override
	public void delete(int reviewNum) {
		session.delete("review.delete", reviewNum);
	}

	@Override

	public List<Integer> likeCount(int itemNum) {
		return session.selectList("review.likeCount", itemNum);
	}

	@Override
	public boolean isExist(ReviewDto dto) {
		Integer reviewNum = session.selectOne("review.isExist", dto);
		if (reviewNum == null) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public List<ReviewJoinDto> reviewList(String reviewWriter) {

		return session.selectList("review.reviewList", reviewWriter);

	}

	@Override
	public boolean isUped(ReviewUpCountDto dto) {
		String id = session.selectOne("review.checkCount", dto);

		if (id == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public void addUpCount(ReviewUpCountDto dto) {

		session.insert("review.addUpCount", dto);

	}

	@Override
	public void delUpCount(ReviewUpCountDto dto) {
		session.delete("review.delUpCount", dto);

	}

	@Override
	public List<ReviewUpCountDto> upList(ReviewUpCountDto dto) {
		return session.selectList("review.getReviewUpCount", dto);
	}

	@Override
	public void upCount(int reviewNum) {
		session.update("review.upCount", reviewNum);

	}

	@Override
	public void downCount(int reviewNum) {
		session.update("review.downCount", reviewNum);

	}

	@Override
	public int checkCount(int reviewNum) {

		return session.selectOne("review.checkUpCount",reviewNum);

	}

}
