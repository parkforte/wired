package com.gr.wired.addBook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/addbook")
public class organizationChartController {
	
	@RequestMapping("/organizationChart")
	public String addbook() {
		
		return "addbook/organizationChart";
	}
	
}
