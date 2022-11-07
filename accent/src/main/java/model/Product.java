package model;


public class Product {
	private int proId;
	private int cateId;
	private int keyId;
	private String proName;
	private int proPrice;
	private int proSale;
	private String proInfo;
	private int proQty;
	private String proImg;
	private String proThumb;
	private String proReview;
	
	public Product(int proId, int cateId, int keyId, String proName, int proPrice, int proSale, String proInfo,
			int proQty, String proImg, String proThumb, String proReview) {
		super();
		this.proId = proId;
		this.cateId = cateId;
		this.keyId = keyId;
		this.proName = proName;
		this.proPrice = proPrice;
		this.proSale = proSale;
		this.proInfo = proInfo;
		this.proQty = proQty;
		this.proImg = proImg;
		this.proThumb = proThumb;
		this.proReview = proReview;
	}
	
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	public int getCateId() {
		return cateId;
	}
	public void setCateId(int cateId) {
		this.cateId = cateId;
	}
	public int getKeyId() {
		return keyId;
	}
	public void setKeyCode(int keyId) {
		this.keyId = keyId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getProPrice() {
		return proPrice;
	}
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	public int getProSale() {
		return proSale;
	}
	public void setProSale(int proSale) {
		this.proSale = proSale;
	}
	public String getProInfo() {
		return proInfo;
	}
	public void setProInfo(String proInfo) {
		this.proInfo = proInfo;
	}
	public int getProQty() {
		return proQty;
	}
	public void setProQty(int proQty) {
		this.proQty = proQty;
	}
	public String getProImg() {
		return proImg;
	}
	public void setProImg(String proImg) {
		this.proImg = proImg;
	}
	public String getProThumb() {
		return proThumb;
	}
	public void setProThumb(String proThumb) {
		this.proThumb = proThumb;
	}
	public String getProReview() {
		return proReview;
	}
	public void setProReview(String proReview) {
		this.proReview = proReview;
	}
	
	public void display() {
		System.out.println("Product [proCode=" + proId + ", cateCode=" + cateId + ", keyCode=" + keyId + ", proName="
				+ proName + ", proPrice=" + proPrice + ", proSale=" + proSale + ", proInfo=" + proInfo + ", proQty="
				+ proQty + ", proImg=" + proImg + ", proThumb=" + proThumb + ", proReview=" + proReview + "]");
	}
}
