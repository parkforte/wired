package com.gr.wired.jawon.model;

import java.sql.Timestamp;

public class JawonVO {
	private int typeNo;
	private String typeName;
	private int resNo;
	private String resName;
	private int resPrice;
	private Timestamp resRegdate;
	private String resLocation;
	private String resFilename;
	private String resOriginalfilename;
	private char apprFlag;
	private char reservFlag;
	private String resInformation;

	public int getTypeNo() {
		return typeNo;
	}
	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public int getResPrice() {
		return resPrice;
	}
	public void setResPrice(int resPrice) {
		this.resPrice = resPrice;
	}
	public Timestamp getResRegdate() {
		return resRegdate;
	}
	public void setResRegdate(Timestamp resRegdate) {
		this.resRegdate = resRegdate;
	}
	public String getResLocation() {
		return resLocation;
	}
	public void setResLocation(String resLocation) {
		this.resLocation = resLocation;
	}
	public String getResFilename() {
		return resFilename;
	}
	public void setResFilename(String resFilename) {
		this.resFilename = resFilename;
	}
	public String getResOriginalfilename() {
		return resOriginalfilename;
	}
	public void setResOriginalfilename(String resOriginalfilename) {
		this.resOriginalfilename = resOriginalfilename;
	}
	public char getApprFlag() {
		return apprFlag;
	}
	public void setApprFlag(char apprFlag) {
		this.apprFlag = apprFlag;
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
		return "JawonVO [typeNo=" + typeNo + ", typeName=" + typeName + ", resNo=" + resNo + ", resName=" + resName
				+ ", resPrice=" + resPrice + ", resRegdate=" + resRegdate + ", resLocation=" + resLocation
				+ ", resFilename=" + resFilename + ", resOriginalfilename=" + resOriginalfilename + ", apprFlag="
				+ apprFlag + ", reservFlag=" + reservFlag + ", resInformation=" + resInformation + "]";
	}


}
