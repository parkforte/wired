package com.gr.wired.employee.model;

import java.sql.Timestamp;

public class EmplVO {
	private int memNo;
	private int ranksNo;
	private int deptNo;
	private String memName;
	private String memHp1;
	private String memHp2;
	private String memHp3;
	private String memEmail1;
	private String memEmail2;
	private String memId;
	private String memPwd;
	private String memZipcode;
	private String memAddress;
	private String memAddressdetail;
	private String memFilename;
	private String memOriginalfilename;
	private Timestamp memJoindate;
	private Timestamp memResigndate;
	private int memPay;
	private int memHoliday;
	private int memUseholiday;
	private int posNo;
	private char memFlag;

	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getRanksNo() {
		return ranksNo;
	}
	public void setRanksNo(int ranksNo) {
		this.ranksNo = ranksNo;
	}
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemHp1() {
		return memHp1;
	}
	public void setMemHp1(String memHp1) {
		this.memHp1 = memHp1;
	}
	public String getMemHp2() {
		return memHp2;
	}
	public void setMemHp2(String memHp2) {
		this.memHp2 = memHp2;
	}
	public String getMemHp3() {
		return memHp3;
	}
	public void setMemHp3(String memHp3) {
		this.memHp3 = memHp3;
	}
	public String getMemEmail1() {
		return memEmail1;
	}
	public void setMemEmail1(String memEmail1) {
		this.memEmail1 = memEmail1;
	}
	public String getMemEmail2() {
		return memEmail2;
	}
	public void setMemEmail2(String memEmail2) {
		this.memEmail2 = memEmail2;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPwd() {
		return memPwd;
	}
	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}
	public String getMemZipcode() {
		return memZipcode;
	}
	public void setMemZipcode(String memZipcode) {
		this.memZipcode = memZipcode;
	}
	public String getMemAddress() {
		return memAddress;
	}
	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}
	public String getMemAddressdetail() {
		return memAddressdetail;
	}
	public void setMemAddressdetail(String memAddressdetail) {
		this.memAddressdetail = memAddressdetail;
	}
	public String getMemFilename() {
		return memFilename;
	}
	public void setMemFilename(String memFilename) {
		this.memFilename = memFilename;
	}
	public String getMemOriginalfilename() {
		return memOriginalfilename;
	}
	public void setMemOriginalfilename(String memOriginalfilename) {
		this.memOriginalfilename = memOriginalfilename;
	}
	public Timestamp getMemJoindate() {
		return memJoindate;
	}
	public void setMemJoindate(Timestamp memJoindate) {
		this.memJoindate = memJoindate;
	}
	public Timestamp getMemResigndate() {
		return memResigndate;
	}
	public void setMemResigndate(Timestamp memResigndate) {
		this.memResigndate = memResigndate;
	}
	public int getMemPay() {
		return memPay;
	}
	public void setMemPay(int memPay) {
		this.memPay = memPay;
	}
	public int getMemHoliday() {
		return memHoliday;
	}
	public void setMemHoliday(int memHoliday) {
		this.memHoliday = memHoliday;
	}
	public int getMemUseholiday() {
		return memUseholiday;
	}
	public void setMemUseholiday(int memUseholiday) {
		this.memUseholiday = memUseholiday;
	}
	public int getPosNo() {
		return posNo;
	}
	public void setPosNo(int posNo) {
		this.posNo = posNo;
	}
	public char getMemFlag() {
		return memFlag;
	}
	public void setMemFlag(char memFlag) {
		this.memFlag = memFlag;
	}
	
	@Override
	public String toString() {
		return "EmplVO [memNo=" + memNo + ", ranksNo=" + ranksNo + ", deptNo=" + deptNo + ", memName=" + memName
				+ ", memHp1=" + memHp1 + ", memHp2=" + memHp2 + ", memHp3=" + memHp3 + ", memEmail1=" + memEmail1
				+ ", memEmail2=" + memEmail2 + ", memId=" + memId + ", memPwd=" + memPwd + ", memZipcode=" + memZipcode
				+ ", memAddress=" + memAddress + ", memAddressdetail=" + memAddressdetail + ", memFilename="
				+ memFilename + ", memOriginalfilename=" + memOriginalfilename + ", memJoindate=" + memJoindate
				+ ", memResigndate=" + memResigndate + ", memPay=" + memPay + ", memHoliday=" + memHoliday
				+ ", memUseholiday=" + memUseholiday + ", posNo=" + posNo + ", memFlag=" + memFlag + "]";
	}
	
	

}
