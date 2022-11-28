package com.test.project01.master.category.Dto;

public class categoryDto {
	/*  
		cateName     varchar2(20)    not null,
	    cateCode     varchar2(30)    not null,
	    cateCodeRef  varchar2(30)    null,
	*/
	
	private String cateLevel;
	private String cateName;
	private String cateCode;
	private String cateCodeRef;
	
	
	public String getCateLevel() {
		return cateLevel;
	}
	public void setCateLevel(String cateLevel) {
		this.cateLevel = cateLevel;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getCateCodeRef() {
		return cateCodeRef;
	}
	public void setCateCodeRef(String cateCodeRef) {
		this.cateCodeRef = cateCodeRef;
	}
	
	
}
