package com.gr.wired.organizationChart.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gr.wired.common.SearchVO;

@Service
public class OrganizationChartServiceImpl implements OrganizationChartService{
	private final OrganizationChartDAO organizationChartDao;
	
	@Autowired
	public OrganizationChartServiceImpl(OrganizationChartDAO organizationChartDao) {
		this.organizationChartDao = organizationChartDao;
	}

	@Override
	public List<OrganizationChartVO> selectByDept(String deptName) {
		return organizationChartDao.selectByDept(deptName);
	}

	@Override
	public List<Map<String, Object>> selectAll(SearchVO searchVo) {
		return organizationChartDao.selectAll(searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return organizationChartDao.selectTotalRecord(searchVo);
	}

	


	
}
