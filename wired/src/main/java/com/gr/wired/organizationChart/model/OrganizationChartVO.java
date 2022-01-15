package com.gr.wired.organizationChart.model;

public class OrganizationChartVO {

	private String memName;
	private String memHp1;
	private String memHp2;
	private String memHp3;
	private String memEmail1;
	private String memEmail2;
	private int posNo;
	private String posName;
	private int deptNo;
	private String deptName;
	
	
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
	public int getPosNo() {
		return posNo;
	}
	public void setPosNo(int posNo) {
		this.posNo = posNo;
	}
	public String getPosName() {
		return posName;
	}
	public void setPosName(String posName) {
		this.posName = posName;
	}
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	@Override
	public String toString() {
		return "OrganizationChartVO [memName=" + memName + ", memHp1=" + memHp1 + ", memHp2=" + memHp2 + ", memHp3="
				+ memHp3 + ", memEmail1=" + memEmail1 + ", memEmail2=" + memEmail2 + ", posNo=" + posNo + ", posName="
				+ posName + ", deptNo=" + deptNo + ", deptName=" + deptName + "]";
	}
	
	
	
}
