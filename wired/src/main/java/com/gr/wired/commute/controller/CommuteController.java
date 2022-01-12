package com.gr.wired.commute.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gr.wired.commute.model.CommuteService;
import com.gr.wired.commute.model.CommuteVO;

@Controller
@RequestMapping("/commute")
public class CommuteController {
	private static final Logger logger
		=LoggerFactory.getLogger(CommuteController.class);
	private final CommuteService commuteService;

	@Autowired
	public CommuteController(CommuteService commuteService) {
		this.commuteService = commuteService;
	}

	@RequestMapping("/commuteList")
	public String commuteList(HttpSession session, Model model) {
		int memNo=(int) session.getAttribute("memNo");
		CommuteVO commuteVo= new CommuteVO();
		commuteVo.setMemNo(memNo);
		logger.info("개인 근태 조회 파라미터, memNo={}", memNo);
		List<Map<String, Object>> clist=commuteService.selectAll(commuteVo);
		model.addAttribute("clist", clist);

		return "commute/commuteList";
	}

	@RequestMapping("/commuteDList")
	public String commuteDList(HttpSession session, Model model) {
		int memNo=(int) session.getAttribute("memNo");

		int deptNo=commuteService.selectDeNo(memNo);

		CommuteVO commuteVo= new CommuteVO();
		commuteVo.setDeptNo(deptNo);
		logger.info("부서별 근태 조회 파라미터, deptNo={}", commuteVo.getDeptNo());
		List<Map<String, Object>> clist=commuteService.selectAll(commuteVo);

		model.addAttribute("deptNo", deptNo);
		model.addAttribute("clist", clist);

		return "commute/commuteList";
	}


	@RequestMapping("/commuteIn")
	public String commuteIn(HttpSession session, Model model) {
		int memNo=(int) session.getAttribute("memNo");
		logger.info("출근 파라미터 memNo={}",memNo);

		int chkNo=commuteService.comCheck(memNo);
		if(chkNo<=0) {
			chkNo=0;
		}
		logger.info("출근 유무, 결과 chkNo={}",chkNo);

		String msg="", url="/commute/commuteList?memNo="+memNo;
		if(chkNo>0) {
			msg="이미 출근 하셨습니다.";
		}else {
			CommuteVO commuteVo = new CommuteVO();
			commuteVo.setMemNo(memNo);

			int cnt=commuteService.insertCommute(commuteVo);

			if(cnt>0) {
				logger.info("출근 성공 cnt={}", cnt);
			}
			msg="출근 완료!";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/commuteOut")
	public String commuteOut(HttpSession session, Model model) {
		int memNo=(int) session.getAttribute("memNo");
		logger.info("퇴근 파라미터 memNo={}", memNo);

		int comNo=commuteService.selectByCNo(memNo);
		logger.info("퇴근번호 comNo={}", comNo);

		int cnt=commuteService.updateCommute(comNo);
		String msg="", url="/commute/commuteList?memNo="+memNo;
		if(cnt>0) {
			logger.info("퇴근 성공 cnt={}",cnt);
			msg="퇴근하였습니다.";
		}else {
			logger.info("퇴근 실패");
			msg="출근상태가 아닙니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/commuteGraph")
	public String graph() {

		return "commute/commuteGraph";
	}
}
