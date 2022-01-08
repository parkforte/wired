package com.gr.wired.confirm.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gr.wired.confirm.model.ConfirmLineService;
import com.gr.wired.confirm.model.ConfirmLineVO;
import com.gr.wired.confirm.model.LineregService;
import com.gr.wired.confirm.model.LineregVO;
import com.gr.wired.employee.model.EmplService;
import com.gr.wired.employee.model.EmplVO;

@Controller
@RequestMapping("/e-approval")
public class ConfirmController {

	private static Logger logger = LoggerFactory.getLogger(ConfirmController.class);

	private final EmplService emplService;
	private final LineregService lineregService;
	private final ConfirmLineService confirmlineService;

	@Autowired
	public ConfirmController(EmplService emplService, LineregService lineregService,
			ConfirmLineService confirmlineService) {
		this.emplService = emplService;
		this.lineregService = lineregService;
		this.confirmlineService = confirmlineService;
	}



	@RequestMapping("/docbox")
	public void docbox_get() {
		logger.info("문서함!");
	}


	@RequestMapping("/signature/paint")
	public void signature_get() {
		logger.info("서명만들기 화면!");
	}

	@GetMapping("/confirm/confirmAdmin")
	public void confirmLinePage(HttpSession session,@RequestParam(defaultValue = "0") int regNo , Model model) {
		int memNo =(int)session.getAttribute("memNo");
		logger.info("결재선관리 화면! memNo={}, regNo={}", memNo, regNo);

		//DB
		List<LineregVO> lineregList= lineregService.SelectAllLinereg(memNo);
		List<ConfirmLineVO> confirmlineList= confirmlineService.selectALLRegNo(regNo);

		model.addAttribute("lineregList", lineregList);
		model.addAttribute("confirmlineList", confirmlineList);


	}

	@PostMapping("/confirm/confirmAdmin")
	public String searchMember(@ModelAttribute EmplVO emplVo, @RequestParam(defaultValue = "0") int regNo, Model model) {
		logger.info("라인등록 사원조회 및 현재 regNo={}, emplVo={}", regNo,emplVo);

		List<Map<String, Object>> emplList=emplService.selectByMemName(emplVo);
		logger.info("사원조회 결과, emplList.size={}", emplList.size());

		model.addAttribute("emplList", emplList);
		logger.info("emplList={}",emplList);

		String url="redirect:confirmAdmin?regNo="+regNo;

		return url;
	}



	@PostMapping("/confirm/addLine")
	public String addLine(@ModelAttribute LineregVO lineregVo, HttpSession session) {
		int memNo =(int)session.getAttribute("memNo");
		logger.info("결재라인명 추가 lineregVo={}, memNo={} ", lineregVo, memNo);

		lineregVo.setMemNo(memNo);

		//DB
		int result=lineregService.insertLinereg(lineregVo);
		if(result>0) {
			logger.info("결재라인명 추가 성공! result={}", result);
		}

		return "redirect:/e-approval/confirm/confirmAdmin";

	}

	@GetMapping("/confirm/deleteLine")
	public String deleteLine(@RequestParam(defaultValue = "0") int regNo, Model model) {
		logger.info("결재라인 삭제, regNo={}", regNo);

		//DB
		int result=lineregService.deleteLinereg(regNo);

		String msg="결재라인 삭제 실패!", url="/e-approval/confirm/confirmAdmin";
		if(result>0) {
			msg="결재라인 삭제 성공!";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}



	@PostMapping("/confirm/lineOrder")
	public String addOrder(@ModelAttribute EmplVO emplVo, Model model) {
		logger.info("결재순서 등록, emplVo={}", emplVo);

		List<Map<String, Object>> emplList=emplService.selectByMemName(emplVo);
		logger.info("사원조회 결과, emplList.size={}", emplList.size());

		model.addAttribute("emplList", emplList);
		logger.info("emplList={}",emplList);

		return "e-approval/confirm/confirmAdmin";
	}


}
