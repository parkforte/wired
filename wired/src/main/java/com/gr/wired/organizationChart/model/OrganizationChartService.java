package com.gr.wired.organizationChart.model;

import java.util.List;
import java.util.Map;

import com.gr.wired.common.SearchVO;

public interface OrganizationChartService {
	List<OrganizationChartVO> selectByDept(String deptName);
	List<Map<String, Object>> selectAll(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
}
