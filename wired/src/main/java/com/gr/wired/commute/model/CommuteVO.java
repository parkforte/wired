package com.gr.wired.commute.model;

import java.sql.Timestamp;

public class CommuteVO {
	private int comNo;
	private int memNo;
	private Timestamp comIndate;
	private Timestamp comOutdate;
	private char comStatus;

	private int deptNo;

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public Timestamp getComIndate() {
		return comIndate;
	}

	public void setComIndate(Timestamp comIndate) {
		this.comIndate = comIndate;
	}

	public Timestamp getComOutdate() {
		return comOutdate;
	}

	public void setComOutdate(Timestamp comOutdate) {
		this.comOutdate = comOutdate;
	}

	public char getComStatus() {
		return comStatus;
	}

	public void setComStatus(char comStatus) {
		this.comStatus = comStatus;
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}


	@Override
	public String toString() {
		return "CommuteVO [comNo=" + comNo + ", memNo=" + memNo + ", comIndate=" + comIndate + ", comOutdate="
				+ comOutdate + ", comStatus=" + comStatus + ", deptNo=" + deptNo + "]";
	}


}
