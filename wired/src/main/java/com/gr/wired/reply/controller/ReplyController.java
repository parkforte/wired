package com.gr.wired.reply.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gr.wired.reply.model.ReplyService;
import com.gr.wired.reply.model.ReplyVO;

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
	
	

	@PostMapping("/boardDetail2")
	public String reWrite(@ModelAttribute ReplyVO replyVo, HttpSession session) {
		//1 파라미터 읽어오기
		String memId=(String)session.getAttribute("memId");
		logger.info("댓글 달기, 파라미터 replyVo={}", replyVo);
		replyVo.setMemNo(replyService.selectById(memId));
		//2 db
		int cnt=replyService.insertBdList(replyVo);
		if(cnt>0) {
			logger.info("댓글 작성 성공!");
		}
		//3 모델에 결과저장

		//4 뷰페이지 리턴
		return "redirect:/board/boardDetail?boardNo="+replyVo.getBoardNo();
	}

}
