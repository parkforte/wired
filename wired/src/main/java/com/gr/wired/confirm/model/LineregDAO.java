package com.gr.wired.confirm.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LineregDAO {
	int insertLinereg(LineregVO lineregVo);
}
