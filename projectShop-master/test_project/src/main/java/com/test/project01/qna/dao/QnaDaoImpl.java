package com.test.project01.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.project01.qna.dto.QnaDto;
import com.test.project01.qna.dto.QnaJoinDto;

@Repository
public class QnaDaoImpl implements QnaDao {

	@Autowired
	private SqlSession session;

	@Override
	public void insert(QnaDto dto) {
		session.insert("qna.insert", dto);

	}

	@Override
	public QnaDto getData(QnaDto dto) {
		return session.selectOne("qna.getData", dto);
	}

	@Override
	public void addViewCount(int num) {
		session.update("qna.addViewCount", num);
	}

	@Override
	public void delete(int num) {
		session.delete("qna.delete", num);
	}

	@Override
	public QnaDto getData(int num) {
		return session.selectOne("qna.getData2", num);
	}

	@Override
	public void update(QnaDto dto) {
		session.update("qna.update", dto);
	}

	@Override
	public int getCount(QnaJoinDto dto) {
		int count = session.selectOne("qna.getCount", dto);
		return count;
	}

	@Override
	public List<QnaJoinDto> getList(QnaJoinDto dto) {

		return session.selectList("qna.getList", dto);
	}

	@Override
	public int getCount2(QnaJoinDto dto) {
		int count = session.selectOne("qna.getCount2", dto);
		return count;
	}

	@Override
	public List<QnaJoinDto> getList2(QnaJoinDto dto) {
		return session.selectList("qna.getList2", dto);
	}

	@Override
	public List<QnaJoinDto> qnaList(String writer) {
		return session.selectList("qna.qnalist",writer);
	}

	public int getCommentCount(int num) {
		Object test=session.selectOne("qnaComment.getCommentCount",num);	
		if(test==null) {
			return 0;
		}else {
			return (int)test;
		}
	}
	@Override
	public QnaDto getData3(QnaDto dto) {
		return session.selectOne("qna.getData3",dto);
	}

}
