package com.gr.wired.webHard.model;

import java.sql.Timestamp;

public class WebHardVO {
	private int webNo;
	private String webName;

	private int fileNo;
	private int memNo;
	private String fileName;
	private String fileOriginalfilename;
	private long fileFilesize;
	private Timestamp fileRegdate;
	private int fileDowncount;

	private String memName;

	public int getWebNo() {
		return webNo;
	}
	public void setWebNo(int webNo) {
		this.webNo = webNo;
	}
	public String getWebName() {
		return webName;
	}
	public void setWebName(String webName) {
		this.webName = webName;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileOriginalfilename() {
		return fileOriginalfilename;
	}
	public void setFileOriginalfilename(String fileOriginalfilename) {
		this.fileOriginalfilename = fileOriginalfilename;
	}
	public long getFileFilesize() {
		return fileFilesize;
	}
	public void setFileFilesize(long fileFilesize) {
		this.fileFilesize = fileFilesize;
	}
	public Timestamp getFileRegdate() {
		return fileRegdate;
	}
	public void setFileRegdate(Timestamp fileRegdate) {
		this.fileRegdate = fileRegdate;
	}
	public int getFileDowncount() {
		return fileDowncount;
	}
	public void setFileDowncount(int fileDowncount) {
		this.fileDowncount = fileDowncount;
	}


	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}

	@Override
	public String toString() {
		return "WebHardVO [webNo=" + webNo + ", webName=" + webName + ", fileNo=" + fileNo + ", memNo=" + memNo
				+ ", fileName=" + fileName + ", fileOriginalfilename=" + fileOriginalfilename + ", fileFilesize="
				+ fileFilesize + ", fileRegdate=" + fileRegdate + ", fileDowncount=" + fileDowncount + ", memName="
				+ memName + "]";
	}



}
