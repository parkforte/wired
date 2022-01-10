package com.gr.wired.board.model;

import java.sql.Timestamp;

public class BoardVO {
	private int boardNo;
	private int memNo;
	private int bdlistNo;
	private String boardTitle;
	private String boardContent;
	private int boardReadcount;
	private Timestamp boardRegdate;
	private Timestamp boardChangedate;

	private String memName;

//	자료실 필드 추가
	private String boardFilename;
	private String boardOriginalfilename;
	private long boardFilesize;
	private int boardDowncount;
	private char boardDelflag;
	private int boardRecommend;
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getBdlistNo() {
		return bdlistNo;
	}
	public void setBdlistNo(int bdlistNo) {
		this.bdlistNo = bdlistNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getBoardReadcount() {
		return boardReadcount;
	}
	public void setBoardReadcount(int boardReadcount) {
		this.boardReadcount = boardReadcount;
	}
	public Timestamp getBoardRegdate() {
		return boardRegdate;
	}
	public void setBoardRegdate(Timestamp boardRegdate) {
		this.boardRegdate = boardRegdate;
	}
	public Timestamp getBoardChangedate() {
		return boardChangedate;
	}
	public void setBoardChangedate(Timestamp boardChangedate) {
		this.boardChangedate = boardChangedate;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getBoardFilename() {
		return boardFilename;
	}
	public void setBoardFilename(String boardFilename) {
		this.boardFilename = boardFilename;
	}
	public String getBoardOriginalfilename() {
		return boardOriginalfilename;
	}
	public void setBoardOriginalfilename(String boardOriginalfilename) {
		this.boardOriginalfilename = boardOriginalfilename;
	}
	public long getBoardFilesize() {
		return boardFilesize;
	}
	public void setBoardFilesize(long boardFilesize) {
		this.boardFilesize = boardFilesize;
	}
	public int getBoardDowncount() {
		return boardDowncount;
	}
	public void setBoardDowncount(int boardDowncount) {
		this.boardDowncount = boardDowncount;
	}
	public char getBoardDelflag() {
		return boardDelflag;
	}
	public void setBoardDelflag(char boardDelflag) {
		this.boardDelflag = boardDelflag;
	}
	public int getBoardRecommend() {
		return boardRecommend;
	}
	public void setBoardRecommend(int boardRecommend) {
		this.boardRecommend = boardRecommend;
	}
	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", memNo=" + memNo + ", bdlistNo=" + bdlistNo + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardReadcount=" + boardReadcount
				+ ", boardRegdate=" + boardRegdate + ", boardChangedate=" + boardChangedate + ", memName=" + memName
				+ ", boardFilename=" + boardFilename + ", boardOriginalfilename=" + boardOriginalfilename
				+ ", boardFilesize=" + boardFilesize + ", boardDowncount=" + boardDowncount + ", boardDelflag="
				+ boardDelflag + ", boardRecommend=" + boardRecommend + "]";
	}



}
