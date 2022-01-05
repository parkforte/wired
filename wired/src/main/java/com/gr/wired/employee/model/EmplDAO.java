package com.gr.wired.employee.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gr.wired.common.SearchVO;

@Mapper
public interface EmplDAO {
	int insertEmployee(EmplVO emplVo);
	String selectPwd(String memId);
	EmplVO selectByMemId(String memId);
	List<Map<String, Object>> selectAll(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);

}
