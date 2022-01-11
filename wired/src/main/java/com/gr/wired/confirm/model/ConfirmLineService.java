package com.gr.wired.confirm.model;

import java.util.List;
import java.util.Map;

public interface ConfirmLineService {
	int insertConfirmLine(LineregVO lineregVo);
	List<Map<String, Object>> selectALLRegNo(int regNo);
	int insertAddLine(ConfirmLineVO lineVo);
	int deleteOrder(ConfirmLineVO confirmlineVo);


}
