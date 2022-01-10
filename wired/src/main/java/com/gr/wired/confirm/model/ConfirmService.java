package com.gr.wired.confirm.model;

public interface ConfirmService {
	int insertPaper(ConfirmVO confirmVo);
	ConfirmVO selectTempByMemNo(int memNo);

}
