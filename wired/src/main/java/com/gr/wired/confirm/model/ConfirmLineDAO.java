package com.gr.wired.confirm.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ConfirmLineDAO {
	int insertConfirmLine(LineregVO lineregVo);
	List<ConfirmLineVO> selectALLRegNo(int regNo);
}
