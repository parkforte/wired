package com.gr.wired.bdList.model;

import java.sql.Timestamp;

public class BdListVO {

	private int bdlistNo;
	private String bdlistName;
	private char bdlistRe; //댓글 허용 여부
	private char bdlistUp; //파일 업로드 가능 여부
	private char bdlistRc; //추천 가능 여부
	private int ranksNo;
	private Timestamp bdlistRegdate;

	public int getBdlistNo() {
		return bdlistNo;
	}
	public void setBdlistNo(int bdlistNo) {
		this.bdlistNo = bdlistNo;
	}
	public String getBdlistName() {
		return bdlistName;
	}
	public void setBdlistName(String bdlistName) {
		this.bdlistName = bdlistName;
	}
	public char getBdlistRe() {
		return bdlistRe;
	}
	public void setBdlistRe(char bdlistRe) {
		this.bdlistRe = bdlistRe;
	}
	public char getBdlistUp() {
		return bdlistUp;
	}
	public void setBdlistUp(char bdlistUp) {
		this.bdlistUp = bdlistUp;
	}
	public char getBdlistRc() {
		return bdlistRc;
	}
	public void setBdlistRc(char bdlistRc) {
		this.bdlistRc = bdlistRc;
	}
	public int getRanksNo() {
		return ranksNo;
	}
	public void setRanksNo(int ranksNo) {
		this.ranksNo = ranksNo;
	}
	public Timestamp getBdlistRegdate() {
		return bdlistRegdate;
	}
	public void setBdlistRegdate(Timestamp bdlistRegdate) {
		this.bdlistRegdate = bdlistRegdate;
	}
	@Override
	public String toString() {
		return "BdListVO [bdlistNo=" + bdlistNo + ", bdlistName=" + bdlistName + ", bdlistRe=" + bdlistRe
				+ ", bdlistUp=" + bdlistUp + ", bdlistRc=" + bdlistRc + ", ranksNo=" + ranksNo + ", bdlistRegdate="
				+ bdlistRegdate + "]";
	}



}
