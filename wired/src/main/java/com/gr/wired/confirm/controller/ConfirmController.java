package com.gr.wired.confirm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/e-approval")
public class ConfirmController {

	@GetMapping("/docbox")
	public String docbox_get() {
		return "e-approval/docbox";
	}
}
