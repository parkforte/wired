package com.gr.wired.jawon.model;

import java.util.List;
import java.util.Map;

public class JawonAllVO {
	private ResTypeVO resTypeVo; //orders테이블, mybatis- 1:1 관계를 처리하는
							//association 엘리먼트 이용
	private List<Map<String, Object>> typeDetailsList;
	//=> jawonDetailsView의 정보를 여러 개 넣을 수 있는 List
	//=> 1:N 관계를 처리하는 collection 엘리먼트 이용

	public ResTypeVO getResTypeVo() {
		return resTypeVo;
	}
	public void setResTypeVo(ResTypeVO resTypeVo) {
		this.resTypeVo = resTypeVo;
	}
	public List<Map<String, Object>> getTypeDetailsList() {
		return typeDetailsList;
	}
	public void setTypeDetailsList(List<Map<String, Object>> typeDetailsList) {
		this.typeDetailsList = typeDetailsList;
	}

	@Override
	public String toString() {
		return "JawonAllVO [resTypeVo=" + resTypeVo + ", typeDetailsList=" + typeDetailsList + "]";
	}

}
