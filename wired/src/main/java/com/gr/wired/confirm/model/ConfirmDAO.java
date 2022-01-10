package com.gr.wired.confirm.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ConfirmDAO {
	int insertPaper(ConfirmVO confirmVo);
	ConfirmVO selectTempByMemNo(int memNo);
}
