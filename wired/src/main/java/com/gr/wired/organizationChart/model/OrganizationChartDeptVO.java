package com.gr.wired.organizationChart.model;

public class OrganizationChartDeptVO {

	private int deptNo;
	private String deptName;
	
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
		return "OrganizationChartDeptVO [deptNo=" + deptNo + ", deptName=" + deptName + ", getDeptNo()=" + getDeptNo()
				+ ", getDeptName()=" + getDeptName() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
	
	
}
