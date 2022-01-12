package com.gr.wired.confirm.model;

import java.util.List;
import java.util.Map;

public interface ConfirmService {
	int insertPaper(ConfirmVO confirmVo);
	ConfirmVO selectTempByMemNo(int memNo);
	int updateContent(ConfirmVO confirmVo);
	List<Map<String, Object>> selectLineorder(int cfNo);

}
