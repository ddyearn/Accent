package com.test.project01.review.dto;

public class ReviewUpCountDto {
	private int num;
	private String id;
	private int reviewNum;
	private String regdate;
	private int itemNum;
	private boolean isLike;
	
	public ReviewUpCountDto() {}

	public ReviewUpCountDto(int num, String id, int reviewNum, String regdate, int itemNum, boolean isLike) {
		super();
		this.num = num;
		this.id = id;
		this.reviewNum = reviewNum;
		this.regdate = regdate;
		this.itemNum = itemNum;
		this.isLike = isLike;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public boolean isLike() {
		return isLike;
	}

	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}

	
	
	
	
}
