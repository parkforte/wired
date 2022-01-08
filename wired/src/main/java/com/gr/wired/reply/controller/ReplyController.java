package com.gr.wired.reply.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gr.wired.reply.model.ReplyService;

@Controller
@RequestMapping("/board")
public class ReplyController {
	private static final Logger logger
		=LoggerFactory.getLogger(ReplyController.class);

	private final ReplyService replyService;

	@Autowired
	public ReplyController(ReplyService replyService) {
		this.replyService = replyService;
	}




}