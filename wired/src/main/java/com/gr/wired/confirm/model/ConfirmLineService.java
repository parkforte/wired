package com.gr.wired.confirm.model;

import java.util.List;

public interface ConfirmLineService {
	int insertConfirmLine(LineregVO lineregVo);
	List<ConfirmLineVO> selectALLRegNo(int regNo);

}
