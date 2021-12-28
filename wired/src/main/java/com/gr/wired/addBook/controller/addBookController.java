package com.gr.wired.addBook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/addbook")
public class addBookController {
	
	@RequestMapping("/addbook")
	public String addbook() {
		
		return "addbook/addBook";
	}
	
}
