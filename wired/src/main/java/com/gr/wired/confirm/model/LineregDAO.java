package com.gr.wired.confirm.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LineregDAO {
	int insertLinereg(LineregVO lineregVo);
	List<LineregVO> SelectAllLinereg(int memNo);
	int deleteLinereg(int regNo);
}
