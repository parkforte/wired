package com.gr.wired.jawon.model;

public class JawonVO {
	private int resNo;
	private int typeNo;
	private String resName;
	private String resLocation;
	private char reservFlag;
	private String resInformation;

	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public int getTypeNo() {
		return typeNo;
	}
	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public String getResLocation() {
		return resLocation;
	}
	public void setResLocation(String resLocation) {
		this.resLocation = resLocation;
	}
	public char getReservFlag() {
		return reservFlag;
	}
	public void setReservFlag(char reservFlag) {
		this.reservFlag = reservFlag;
	}
	public String getResInformation() {
		return resInformation;
	}
	public void setResInformation(String resInformation) {
		this.resInformation = resInformation;
	}

	@Override
	public String toString() {
		return "JawonVO [resNo=" + resNo + ", typeNo=" + typeNo + ", resName=" + resName + ", resLocation="
				+ resLocation + ", reservFlag=" + reservFlag + ", resInformation=" + resInformation + "]";
	}

}
