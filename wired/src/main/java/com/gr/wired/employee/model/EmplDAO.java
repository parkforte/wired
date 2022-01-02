package com.gr.wired.employee.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmplDAO {
	int insertEmployee(EmplVO emplVo);
	String selectPwd(String memId);
	EmplVO selectByMemId(String memId);
}
