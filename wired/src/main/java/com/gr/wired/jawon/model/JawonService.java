package com.gr.wired.jawon.model;

import java.util.List;
import java.util.Map;

public interface JawonService {
	int insertJawonList(JawonVO jawonVo);
	List<Map<String, Object>> selectJawonAll();
	List<JawonVO> selectJawonName();
}
