package com.gr.wired.jawon.model;

import java.util.List;
import java.util.Map;

public interface JawonService {
	int insertJawonList(ResTypeVO resTypeVo);
	List<ResTypeVO> selectType();
	List<Map<String, Object>> selectJawonDetailsView(int typeNo);
	List<JawonAllVO> selectJawonAll();
	List<Map<String, Object>> selectByType(int typeNo);
	int insertJawonReserve(ResScheduleVO resScheduleVo);
	List<Map<String, Object>> selectJawonMyView(int memNo);
	int deleteReserve(int reservNo);
	List<Map<String, Object>> selectJawonAllView();
	int deleteJawonType(int typeNo);
	int insertJawon(JawonVO jawonVo);
	int updateJawon(JawonVO jawonVo);
	JawonVO selectJawonLoc(int resNo);
}
