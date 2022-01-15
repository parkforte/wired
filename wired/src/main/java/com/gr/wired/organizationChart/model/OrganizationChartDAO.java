package com.gr.wired.organizationChart.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gr.wired.common.SearchVO;

@Mapper
public interface OrganizationChartDAO {
	List<OrganizationChartVO> selectByDept(String deptName);
	List<Map<String, Object>> selectAll(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
	
}
