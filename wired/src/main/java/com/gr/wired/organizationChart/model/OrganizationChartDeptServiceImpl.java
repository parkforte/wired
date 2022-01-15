package com.gr.wired.organizationChart.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrganizationChartDeptServiceImpl implements OrganizationChartDeptService{
	private final OrganizationChartDeptDAO organizationChartDeptDao;
	
	
	@Autowired
	public OrganizationChartDeptServiceImpl(OrganizationChartDeptDAO organizationChartDeptDao) {
		this.organizationChartDeptDao = organizationChartDeptDao;
	}


	@Override
	public List<OrganizationChartDeptVO> selectDepartmentAll() {
		return organizationChartDeptDao.selectDepartmentAll();
	}
	
}
