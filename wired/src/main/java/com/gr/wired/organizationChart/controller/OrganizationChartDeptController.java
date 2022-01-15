package com.gr.wired.organizationChart.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gr.wired.organizationChart.model.OrganizationChartDeptService;
import com.gr.wired.organizationChart.model.OrganizationChartDeptVO;

@Controller
@RequestMapping("/organChart")
public class OrganizationChartDeptController {
	
	private static final Logger Logger = LoggerFactory.getLogger(OrganizationChartDeptController.class);
	
	private final OrganizationChartDeptService organizationChartDeptService;
	
	@Autowired
	public OrganizationChartDeptController(OrganizationChartDeptService organizationChartDeptService) {
		this.organizationChartDeptService = organizationChartDeptService;
	}
	
	@RequestMapping("/organizationChartDept")
	public String deptList(Model model) {
		Logger.info("부서 목록 페이지");
		
		List<OrganizationChartDeptVO> list=organizationChartDeptService.selectDepartmentAll();
		Logger.info("카테고리 조회,결과 list.size={}", list.size());
		
		model.addAttribute("deptList",list);
		
		return "organChart/organizationChartDept";
	}
}
