package com.gr.wired.jawon.model;

public class JawonVO {
	private int resNo;
	private int typeNo;
	private String resName;
	private String resLocation;
	private char reservFlag;
	private String resInformation;
	private String resLat;
	private String resLng;

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

	public String getResLat() {
		return resLat;
	}
	public void setResLat(String resLat) {
		this.resLat = resLat;
	}
	public String getResLng() {
		return resLng;
	}
	public void setResLng(String resLng) {
		this.resLng = resLng;
	}

	@Override
	public String toString() {
		return "JawonVO [resNo=" + resNo + ", typeNo=" + typeNo + ", resName=" + resName + ", resLocation="
				+ resLocation + ", reservFlag=" + reservFlag + ", resInformation=" + resInformation + ", resLat="
				+ resLat + ", resLng=" + resLng + "]";
	}


}
