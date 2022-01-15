package com.gr.wired.organizationChart.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gr.wired.addBook.controller.addressBookController;
import com.gr.wired.common.ConstUtil;
import com.gr.wired.common.PaginationInfo;
import com.gr.wired.common.SearchVO;
import com.gr.wired.organizationChart.model.OrganizationChartService;
import com.gr.wired.organizationChart.model.OrganizationChartVO;

@Controller
@RequestMapping("/organChart")
public class OrganizationChartController {
	private static final Logger logger
	=LoggerFactory.getLogger(OrganizationChartController.class);
	
	
	private final OrganizationChartService organizationChartService;
	
	@Autowired
	public OrganizationChartController(OrganizationChartService organizationChartService) {
		this.organizationChartService = organizationChartService;
	}


	@RequestMapping("/organizationChart")
	public String selectByDept(@RequestParam(defaultValue = "") String deptName, Model model) {
		logger.info("부서별 직원 조회, 파라미터 deptName={}", deptName);
		
		List<OrganizationChartVO> list=organizationChartService.selectByDept(deptName);
		logger.info("부서별 직원 조회 결과, list.size={}", list.size());
		
		model.addAttribute("organList", list);
		
		return "organChart/organizationChart";
	}
	
	
	
}
