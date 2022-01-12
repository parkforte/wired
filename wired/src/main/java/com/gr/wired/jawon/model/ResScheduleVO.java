package com.gr.wired.jawon.model;

import java.sql.Timestamp;

public class ResScheduleVO {
	private int reservNo;
	private int memNo;
	private int resNo;
	private String useRegdate;
	private String returnRegdate;
	private String reservContent;

	public int getReservNo() {
		return reservNo;
	}


	public void setReservNo(int reservNo) {
		this.reservNo = reservNo;
	}


	public int getMemNo() {
		return memNo;
	}


	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}


	public int getResNo() {
		return resNo;
	}


	public void setResNo(int resNo) {
		this.resNo = resNo;
	}


	public String getUseRegdate() {
		return useRegdate;
	}


	public void setUseRegdate(String useRegdate) {
		this.useRegdate = useRegdate;
	}


	public String getReturnRegdate() {
		return returnRegdate;
	}


	public void setReturnRegdate(String returnRegdate) {
		this.returnRegdate = returnRegdate;
	}


	public String getReservContent() {
		return reservContent;
	}


	public void setReservContent(String reservContent) {
		this.reservContent = reservContent;
	}

	@Override
	public String toString() {
		return "ResScheduleVO [reservNo=" + reservNo + ", memNo=" + memNo + ", resNo=" + resNo + ", useRegdate="
				+ useRegdate + ", returnRegdate=" + returnRegdate + ", reservContent=" + reservContent + "]";
	}


}
