package com.gr.wired.addBook.model;

public class addressBookVO {
	private int addrbookNo;
	private String addrbookName;
	private String addrbookComname;
	private String addrbookTel;
	private String addrbookEmail;
	private int memNo;
	private String addrbookDept;
	private String addrbookRank;
	
	public int getAddrbookNo() {
		return addrbookNo;
	}
	public void setAddrbookNo(int addrbookNo) {
		this.addrbookNo = addrbookNo;
	}
	public String getAddrbookName() {
		return addrbookName;
	}
	public void setAddrbookName(String addrbookName) {
		this.addrbookName = addrbookName;
	}
	public String getAddrbookComname() {
		return addrbookComname;
	}
	public void setAddrbookComname(String addrbookComname) {
		this.addrbookComname = addrbookComname;
	}
	public String getAddrbookTel() {
		return addrbookTel;
	}
	public void setAddrbookTel(String addrbookTel) {
		this.addrbookTel = addrbookTel;
	}
	public String getAddrbookEmail() {
		return addrbookEmail;
	}
	public void setAddrbookEmail(String addrbookEmail) {
		this.addrbookEmail = addrbookEmail;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getAddrbookDept() {
		return addrbookDept;
	}
	public void setAddrbookDept(String addrbookDept) {
		this.addrbookDept = addrbookDept;
	}
	public String getAddrbookRank() {
		return addrbookRank;
	}
	public void setAddrbookRank(String addrbookRank) {
		this.addrbookRank = addrbookRank;
	}
	@Override
	public String toString() {
		return "addressBookVO [addrbookNo=" + addrbookNo + ", addrbookName=" + addrbookName + ", addrbookComname="
				+ addrbookComname + ", addrbookTel=" + addrbookTel + ", addrbookEmail=" + addrbookEmail + ", memNo="
				+ memNo + ", addrbookDept=" + addrbookDept + ", addrbookRank=" + addrbookRank + "]";
	}
	
	
	
	
}
