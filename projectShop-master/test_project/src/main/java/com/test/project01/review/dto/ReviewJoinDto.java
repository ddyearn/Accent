package com.test.project01.review.dto;

public class ReviewJoinDto {
	private int reviewNum;
	private String reviewWriter;
	private String itemImg;
	private String itemName;
	private int itemNum;
	private String reviewContent;
	private int likeCount;
	private int upCount;
	private String regdate;
	private int startRowNum;
	private int endRowNum;
	
	public ReviewJoinDto() {}

	public ReviewJoinDto(int reviewNum, String reviewWriter, String itemImg, String itemName, int itemNum,String reviewContent,
			int likeCount, int upCount, String regdate, int startRowNum, int endRowNum) {
		super();
		this.reviewNum = reviewNum;
		this.reviewWriter = reviewWriter;
		this.itemImg = itemImg;
		this.itemName = itemName;
		this.itemNum = itemNum;
		this.reviewContent=reviewContent;
		this.likeCount = likeCount;
		this.upCount = upCount;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public String getReviewContent() {
		return reviewContent;
	}
	public void serReviewContent(String reviewContent) {
		this.reviewContent=reviewContent;
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

	public String getItemImg() {
		return itemImg;
	}

	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
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
	
}
