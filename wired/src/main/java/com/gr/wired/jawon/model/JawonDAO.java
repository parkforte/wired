package com.gr.wired.jawon.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JawonDAO {
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
}
