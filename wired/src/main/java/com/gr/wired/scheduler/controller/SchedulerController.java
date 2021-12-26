package com.gr.wired.scheduler.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/scheduler")
public class SchedulerController {

	private static final Logger logger
		= LoggerFactory.getLogger(SchedulerController.class);
	
	//개인스케쥴러
	//http://localhost:9091/wired/scheduler/personal
	@GetMapping("/personal")
	public String personal_get() {
		
		return "scheduler/personal";
	}
	
	
	//팀스케쥴러
	//http://localhost:9091/wired/scheduler/team
	@GetMapping("/team")
	public String team_get() {
		
		return "scheduler/team";
	}
	
	
}
