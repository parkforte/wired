package com.gr.wired.jawon.model;

public class ResTypeVO {
	private int typeNo;
	private String typeName;

	public int getTypeNo() {
		return typeNo;
	}
	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@Override
	public String toString() {
		return "ResTypeVO [typeNo=" + typeNo + ", typeName=" + typeName + "]";
	}

}
