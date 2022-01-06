package com.gr.wired.reply.model;

import java.sql.Timestamp;

public class ReplyVO {
	private int repNo;
	private String repContent;
	private Timestamp repRegdate;

	private int repGroup;
	private int repSortNo;
	private int repDepth;

	private char repSecret;
	private int memNo;
	private int boardNo;


	public int getRepNo() {
		return repNo;
	}
	public void setRepNo(int repNo) {
		this.repNo = repNo;
	}
	public String getRepContent() {
		return repContent;
	}
	public void setRepContent(String repContent) {
		this.repContent = repContent;
	}
	public Timestamp getRepRegdate() {
		return repRegdate;
	}
	public void setRepRegdate(Timestamp repRegdate) {
		this.repRegdate = repRegdate;
	}
	public int getRepGroup() {
		return repGroup;
	}
	public void setRepGroup(int repGroup) {
		this.repGroup = repGroup;
	}
	public int getRepSortNo() {
		return repSortNo;
	}
	public void setRepSortNo(int repSortNo) {
		this.repSortNo = repSortNo;
	}
	public int getRepDepth() {
		return repDepth;
	}
	public void setRepDepth(int repDepth) {
		this.repDepth = repDepth;
	}
	public char getRepSecret() {
		return repSecret;
	}
	public void setRepSecret(char repSecret) {
		this.repSecret = repSecret;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	@Override
	public String toString() {
		return "ReplyVO [repNo=" + repNo + ", repContent=" + repContent + ", repRegdate=" + repRegdate + ", repGroup="
				+ repGroup + ", repSortNo=" + repSortNo + ", repDepth=" + repDepth + ", repSecret=" + repSecret
				+ ", memNo=" + memNo + ", boardNo=" + boardNo + "]";
	}


}
