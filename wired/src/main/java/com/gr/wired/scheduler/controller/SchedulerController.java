package com.gr.wired.scheduler.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/ajaxPersonalSave")
	@ResponseBody
	public void ajaxPersonalSave(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String memId = "admin";
		String title = request.getParameter("title");	//이벤트명칭
		String allDay = request.getParameter("allDay");	//하루 종일의 이벤트인지 알려주는 boolean값
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		
		logger.info("ajax json데이터 title={}, alldaty={}, start={}, end={}", title, allDay, start, end);
	}
	
	
	//팀스케쥴러
	//http://localhost:9091/wired/scheduler/team
	@GetMapping("/team")
	public String team_get() {
		
		return "scheduler/team";
	}
	
	
}
