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
	
	@RequestMapping("/emplList")
	public String emplAll() {
		return "employee/emplList";
	}
	@RequestMapping("/emplEdit")
	public String emplEdit() {
		return "employee/emplEdit";
	}
	@RequestMapping("/emplResign")
	public String emplquit() {
		return "employee/emplResign";
	}
}
