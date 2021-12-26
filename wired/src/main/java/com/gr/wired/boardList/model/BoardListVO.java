package com.gr.wired.boardList.model;

import java.sql.Timestamp;

public class BoardListVO {
	private int bdlistNo;
	private String bdlistName;
	private char bdlistRe;
	private char bdlistUp;
	private char bdlistRc;
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
		return "BoardListVO [bdlistNo=" + bdlistNo + ", bdlistName=" + bdlistName + ", bdlistRe=" + bdlistRe
				+ ", bdlistUp=" + bdlistUp + ", bdlistRc=" + bdlistRc + ", ranksNo=" + ranksNo + ", bdlistRegdate="
				+ bdlistRegdate + "]";
	}
	
	
	
}
