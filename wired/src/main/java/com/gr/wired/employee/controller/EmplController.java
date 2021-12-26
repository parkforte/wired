package com.gr.wired.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employee")
public class EmplController {
	
	@RequestMapping("/emplRegister")
	public String emplInsert() {
		return "employee/emplRegister";
	}
}
