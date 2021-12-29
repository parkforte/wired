package com.gr.wired.doctype.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/e-approval/doctype")
public class DoctypeController {

	@GetMapping("/admin")
	public String admin_get() {
		
		return "e-approval/doctype/admin";
		
	}
}
