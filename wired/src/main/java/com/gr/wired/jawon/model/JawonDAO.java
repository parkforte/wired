package com.gr.wired.jawon.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JawonDAO {
	int insertJawonList(JawonVO jawonVo);
	List<Map<String, Object>> selectJawonAll();
	List<JawonVO> selectJawonName();
}
