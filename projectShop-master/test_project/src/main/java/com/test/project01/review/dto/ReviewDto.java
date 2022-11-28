package com.test.project01.review.dto;

public class ReviewDto {
	private int reviewNum;
	private String reviewWriter;
	private int itemNum;
	private String reviewContent;
	private int likeCount;
	private int upCount;
	private String regdate;
	private int startRowNum;
	private int endRowNum;
	private boolean isLike;
	
	public ReviewDto() {}

	public ReviewDto(int reviewNum, String reviewWriter, int itemNum, String reviewContent, int likeCount, int upCount,
			String regdate, int startRowNum, int endRowNum, boolean isLike) {
		super();
		this.reviewNum = reviewNum;
		this.reviewWriter = reviewWriter;
		this.itemNum = itemNum;
		this.reviewContent = reviewContent;
		this.likeCount = likeCount;
		this.upCount = upCount;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.isLike = isLike;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getUpCount() {
		return upCount;
	}

	public void setUpCount(int upCount) {
		this.upCount = upCount;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public boolean getIsLike() {
		return isLike;
	}

	public void setIsLike(boolean isLike) {
		this.isLike = isLike;
	}

	
	
	
}
