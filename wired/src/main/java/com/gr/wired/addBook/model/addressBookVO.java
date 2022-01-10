package com.gr.wired.addBook.model;

public class addressBookVO {
	private int addbookNo;
	private String addbookName;
	private String addbookComname;
	private String addbookTel;
	private String addbookEmail;
	private String addbookDept;
	private String addbookRank;
	public String getAddbookDept() {
		return addbookDept;
	}
	public void setAddbookDept(String addbookDept) {
		this.addbookDept = addbookDept;
	}
	public String getAddbookRank() {
		return addbookRank;
	}
	public void setAddbookRank(String addbookRank) {
		this.addbookRank = addbookRank;
	}

	private int memNo;
	
	
	public int getAddbookNo() {
		return addbookNo;
	}
	public void setAddbookNo(int addbookNo) {
		this.addbookNo = addbookNo;
	}
	public String getAddbookName() {
		return addbookName;
	}
	public void setAddbookName(String addbookName) {
		this.addbookName = addbookName;
	}
	public String getAddbookComname() {
		return addbookComname;
	}
	public void setAddbookComname(String addbookComname) {
		this.addbookComname = addbookComname;
	}
	public String getAddbookTel() {
		return addbookTel;
	}
	public void setAddbookTel(String addbookTel) {
		this.addbookTel = addbookTel;
	}
	
	public String getAddbookEmail() {
		return addbookEmail;
	}
	public void setAddbookEmail(String addbookEmail) {
		this.addbookEmail = addbookEmail;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	
	@Override
	public String toString() {
		return "addressBookVO [addbookNo=" + addbookNo + ", addbookName=" + addbookName + ", addbookComname="
				+ addbookComname + ", addbookTel=" + addbookTel + ", addbookEmail=" + addbookEmail + ", addbookDept="
				+ addbookDept + ", addbookRank=" + addbookRank + ", memNo=" + memNo + "]";
	}
}
