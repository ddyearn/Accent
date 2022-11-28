package com.test.project01.qna.dto;

public class QnaJoinDto {
	private int num;
	private String itemImg;
	private String itemName;
	private String writer;
	private String title;
	private String content;
	private int viewCount;
	private String regdate;
	private int startRowNum;
	private int endRowNum;
	private int prevNum; //이전글의 글번호를 담을 필드
	private int nextNum; //다음글의 글번호를 담을 필드
	private String itemNum;
	private int commentCount;
	
	public QnaJoinDto() {}

	

	



	public QnaJoinDto(int num, String itemImg, String itemName, String writer, String title, String content,
			int viewCount, String regdate, int startRowNum, int endRowNum, int prevNum, int nextNum, String itemNum,
			int commentCount) {
		super();
		this.num = num;
		this.itemImg = itemImg;
		this.itemName = itemName;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.viewCount = viewCount;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
		this.itemNum = itemNum;
		this.commentCount = commentCount;
	}







	public int getCommentCount() {
		return commentCount;
	}







	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}







	public String getItemNum() {
		return itemNum;
	}



	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}



	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
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

	public int getPrevNum() {
		return prevNum;
	}

	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}

	public int getNextNum() {
		return nextNum;
	}

	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}

	

	
	
}
