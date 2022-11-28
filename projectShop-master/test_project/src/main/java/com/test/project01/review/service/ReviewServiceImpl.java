package com.test.project01.review.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.test.project01.review.dao.ReviewCommentDao;
import com.test.project01.review.dao.ReviewDao;
import com.test.project01.review.dto.ReviewCommentDto;
import com.test.project01.review.dto.ReviewDto;
import com.test.project01.review.dto.ReviewJoinDto;
import com.test.project01.review.dto.ReviewUpCountDto;
import com.test.project01.users.Dto.UsersDto;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	ReviewDao dao;
	@Autowired
	ReviewCommentDao reviewCommentDao;

	// 모든 아이템의 리뷰보기
	@Override
	public void list(HttpServletRequest request) {
		ReviewJoinDto dto = new ReviewJoinDto();

		/* 페이지 처리하는 코드 */
		// 한 페이지에 나타낼 row 의 갯수
		final int PAGE_ROW_COUNT = 5;
		// 하단 디스플레이 페이지 갯수
		final int PAGE_DISPLAY_COUNT = 5;

		// 보여줄 페이지의 번호
		int pageNum = 1;
		// 보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum = request.getParameter("pageNum");
		if (strPageNum != null) {// 페이지 번호가 파라미터로 넘어온다면
			// 페이지 번호를 설정한다.
			pageNum = Integer.parseInt(strPageNum);
		}
		// 보여줄 페이지 데이터의 시작 ResultSet row 번호 (startRowNum을 계산하는 식)
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		// 보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum = pageNum * PAGE_ROW_COUNT;

		// 전체 row 의 갯수를 읽어온다.
		int totalRow = dao.getCount(dto);
		// 전체 페이지의 갯수 구하기 (.ceil -> 올림연산 .floor -> 내림연산)
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
		// 시작 페이지 번호(자바에서 정수를 정수로 나누면 정수만 나와서 (1/5)*5 = 0 으로 나온다.(몫이 나온다))
		int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		// 끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
		// 끝 페이지 번호가 잘못된 값이라면
		if (totalPageCount < endPageNum) {
			endPageNum = totalPageCount; // 보정해준다.
		}

		// startRowNum과 endRowNum을 담는다.
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);

		// 1.DB에서 글 목록을 얻어온다.
		List<ReviewJoinDto> list = dao.getList(dto);

		// 2.글 목록을 응답한다
		// EL, JSTL 을 활용하기 위해 필요한 모델을 request에 담는다.
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("totalRow", totalRow);
	}

	// 해당아이템의 리뷰 목록보기
	@Override
	public void list2(HttpServletRequest request) {
		ReviewJoinDto dto = new ReviewJoinDto();
		int itemNum = Integer.parseInt(request.getParameter("itemNum"));
		dto.setItemNum(itemNum);
		request.setAttribute("itemNum", itemNum);

		// 해당 아이템의 별점 평균 구하기
		List<Integer> likeCountList = dao.likeCount(itemNum);
		int size = likeCountList.size();
		int likeCountSum = 0;
		for (int i = 0; i < likeCountList.size(); i++) {
			likeCountSum += likeCountList.get(i);
		}
		int avg = 0;
		if (size > 0) {
			avg = likeCountSum / size;
		}
		request.setAttribute("avg", avg);

		/* 페이지 처리하는 코드 */
		// 한 페이지에 나타낼 row 의 갯수
		final int PAGE_ROW_COUNT = 5;
		// 하단 디스플레이 페이지 갯수
		final int PAGE_DISPLAY_COUNT = 5;

		// 보여줄 페이지의 번호
		int pageNum = 1;
		// 보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.
		//String strPageNum = request.getParameter("pageNum");
		String strReviewNum = request.getParameter("reviewNum");
		if (strReviewNum != null) {// 페이지 번호가 파라미터로 넘어온다면
			// 페이지 번호를 설정한다.
			pageNum = Integer.parseInt(strReviewNum);
		}
		// 보여줄 페이지 데이터의 시작 ResultSet row 번호 (startRowNum을 계산하는 식)
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		// 보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum = pageNum * PAGE_ROW_COUNT;

		// 전체 row 의 갯수를 읽어온다.
		int totalRow = dao.getCount2(dto);
		// 전체 페이지의 갯수 구하기 (.ceil -> 올림연산 .floor -> 내림연산)
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
		// 시작 페이지 번호(자바에서 정수를 정수로 나누면 정수만 나와서 (1/5)*5 = 0 으로 나온다.(몫이 나온다))
		int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		// 끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
		// 끝 페이지 번호가 잘못된 값이라면
		if (totalPageCount < endPageNum) {
			endPageNum = totalPageCount; // 보정해준다.
		}

		// Dto 객체에 위에서 계산된 startRowNum과 endRowNum을 담는다.
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//1.DB에서 글 목록을 얻어온다.
		List<ReviewJoinDto> reviewlist=dao.getList2(dto);
		//list에서 reviewContent
//		List<ReviewJoinDto> reviewList2=dao.getList2(dto);
//		List<ReviewJoinDto> resultDto = new ArrayList<ReviewJoinDto>();
//		for(int i = 0; i < reviewList2.size(); i++) {
//			String a = reviewlist.get(i).getReviewContent();
//			
//			
//		}
		
		//EL, JSTL 을 활용하기 위해 필요한 모델을 request에 담는다.
		
		request.setAttribute("reviewlist", reviewlist);
		request.setAttribute("reviewNum", pageNum);
		request.setAttribute("RstartPageNum", startPageNum);
		request.setAttribute("RendPageNum", endPageNum);
		request.setAttribute("RtotalPageCount", totalPageCount);
		request.setAttribute("RtotalRow", totalRow);

	}

	@Override
	public void insertform(HttpServletRequest request) {
		int itemNum = Integer.parseInt(request.getParameter("itemNum"));

		request.setAttribute("itemNum", itemNum);

	}

	@Override
	public void insert(HttpServletRequest request, ReviewDto dto) {

		int itemNum = Integer.parseInt(request.getParameter("itemNum"));
		String reviewWriter = request.getParameter("reviewWriter");

		String reviewContent = request.getParameter("reviewContent");
		int likeCount = Integer.parseInt(request.getParameter("likeCount"));

		dto.setItemNum(itemNum);
		dto.setReviewWriter(reviewWriter);
		dto.setReviewContent(reviewContent);
		dto.setLikeCount(likeCount);
		dao.insert(dto);
		request.setAttribute("dto", dto);
	}

	@Override
	public void getReviewData(HttpServletRequest request) {
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));

		ReviewDto dto = dao.getData(reviewNum);
		ReviewUpCountDto chDto = new ReviewUpCountDto();
		chDto.setId((String) request.getSession().getAttribute("id"));
		chDto.setReviewNum(reviewNum);
		boolean isLike = dao.isUped(chDto);
		dto.setIsLike(isLike);
		request.setAttribute("dto", dto);

		List<ReviewCommentDto> commentList = reviewCommentDao.getList(reviewNum);
		request.setAttribute("commentList", commentList);
	}

	@Override
	public void update(HttpServletRequest request, ReviewDto dto) {
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		String reviewContent = request.getParameter("reviewContent");
		int likeCount = Integer.parseInt(request.getParameter("likeCount"));
		dto.setReviewNum(reviewNum);
		dto.setReviewContent(reviewContent);
		dto.setLikeCount(likeCount);
		dao.update(dto);
		request.setAttribute("dto", dto);
	}

	@Override
	public void delete(HttpServletRequest request, int reviewNum) {
		UsersDto userDto = (UsersDto) request.getSession().getAttribute("userDto");
		String userId = userDto.getUserId();
		String reviewWriter = dao.getData(reviewNum).getReviewWriter();
		if (!userId.equals(reviewWriter)) {
			// throw new CanNotDeleteException();
		}
		dao.delete(reviewNum);
	}

	@Override
	public void getUpdateData(ModelAndView mView, int reviewNum) {

		ReviewDto dto = dao.getData(reviewNum);
		mView.addObject("dto", dto);
	}

	@Override
	public void deleteComment(int num) {
		reviewCommentDao.delete(num);
	}

	@Override
	public void saveComment(HttpServletRequest request) {
		UsersDto userDto = (UsersDto) request.getSession().getAttribute("userDto");
		String writer = userDto.getUserId();

		int ref_group = Integer.parseInt(request.getParameter("ref_group"));

		String target_id = request.getParameter("target_id");

		String content = request.getParameter("content");

		String comment_group = request.getParameter("comment_group");

		int seq = reviewCommentDao.getSequence();

		ReviewCommentDto dto = new ReviewCommentDto();
		dto.setNum(seq);
		dto.setWriter(writer);
		dto.setTarget_id(target_id);
		dto.setContent(content);
		dto.setRef_group(ref_group);

		if (comment_group == null) {
			dto.setComment_group(seq);
		} else {
			dto.setComment_group(Integer.parseInt(comment_group));
		}
		reviewCommentDao.insert(dto);
	}

	@Override
	public void updateComment(ReviewCommentDto dto) {
		reviewCommentDao.update(dto);
	}

	@Override
	public boolean isExist(HttpServletRequest request, int itemNum) {
		UsersDto userDto = (UsersDto) request.getSession().getAttribute("userDto");
		String reviewWriter = userDto.getUserId();
		ReviewDto dto = new ReviewDto();
		dto.setReviewWriter(reviewWriter);
		dto.setItemNum(itemNum);
		boolean isExist = dao.isExist(dto);
		return isExist;
	}

	@Override
	public void reviewList(HttpServletRequest request) {
		UsersDto userDto = (UsersDto) request.getSession().getAttribute("userDto");
		String reviewWriter = userDto.getUserId();
		List<ReviewJoinDto> reviewlist = dao.reviewList(reviewWriter);
		request.setAttribute("reviewlist", reviewlist);
	}

	@Override
	public Map<String, Object> addUpCount(HttpServletRequest request, ReviewUpCountDto dto) {
		dto.setId((String) request.getSession().getAttribute("id"));
		boolean isUped = dao.isUped(dto);
		if (isUped) {
			dao.downCount(dto.getReviewNum());
			dao.delUpCount(dto);
			int count = dao.checkCount(dto.getReviewNum());
			Map<String, Object> map = new HashMap<>();
			map.put("checkUp", false);
			map.put("count", count);
			map.put("reviewNum", dto.getReviewNum());
			return map;
		} else {
			dao.upCount(dto.getReviewNum());
			// 이상무
			dao.addUpCount(dto);
			// 이상무
			int count = dao.checkCount(dto.getReviewNum());

			Map<String, Object> map = new HashMap<>();
			map.put("checkUp", true);
			map.put("count", count);
			map.put("reviewNum", dto.getReviewNum());
			return map;
		}
	}

}
