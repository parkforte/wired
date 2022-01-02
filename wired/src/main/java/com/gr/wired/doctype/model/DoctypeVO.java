package com.gr.wired.doctype.model;

public class DoctypeVO {

	private int typeNo;
	private String typeName;
	private String typeDel;

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
	public String getTypeDel() {
		return typeDel;
	}
	public void setTypeDel(String typeDel) {
		this.typeDel = typeDel;
	}
	@Override
	public String toString() {
		return "DoctypeVO [typeNo=" + typeNo + ", typeName=" + typeName + ", typeDel=" + typeDel + "]";
	}



}
