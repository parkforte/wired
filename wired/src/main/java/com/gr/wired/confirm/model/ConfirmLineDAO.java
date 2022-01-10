package com.gr.wired.confirm.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ConfirmLineDAO {
	int insertConfirmLine(LineregVO lineregVo);
	List<Map<String, Object>> selectALLRegNo(int regNo);
	int insertAddLine(ConfirmLineVO lineVo);
}
