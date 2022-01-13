package com.gr.wired.commute.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gr.wired.common.ConstUtil;
import com.gr.wired.common.PaginationInfo;
import com.gr.wired.common.SearchVO;
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
	public String commuteList(@ModelAttribute SearchVO searchVo, HttpSession session, Model model) {
		int memNo = (int) session.getAttribute("memNo");
		searchVo.setMemNo(memNo);
		logger.info("개인 근태 조회 파라미터, memNo={}", searchVo.getMemNo());

		//[1] paginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//[2] searchVo에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("값 셋팅 후 searchVo={}", searchVo);

		List<Map<String, Object>> clist=commuteService.selectAll(searchVo);
		logger.info("clist.size={}", clist.size());

		//[3] totalPage
		int totalRecord=commuteService.selectTotalRecord(searchVo);
		logger.info("totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("clist", clist);
		model.addAttribute("pagingInfo", pagingInfo);

		return "commute/commuteList";
	}

	@RequestMapping("/commuteDList")
	public String commuteDList(@ModelAttribute SearchVO searchVo, HttpSession session, Model model) {
		int memNo=(int) session.getAttribute("memNo");
		int deptNo=commuteService.selectDeNo(memNo);
		searchVo.setDeptNo(deptNo);
		logger.info("부서별 근태 조회 파라미터, deptNo={}", searchVo.getDeptNo());

		//[1] paginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//[2] searchVo에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("값 셋팅 후 searchVo={}", searchVo);

		List<Map<String, Object>> clist=commuteService.selectAll(searchVo);
		logger.info("clist.size={}", clist.size());

		//[3] totalPage
		int totalRecord=commuteService.selectTotalRecord(searchVo);
		logger.info("totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("deptNo", searchVo.getDeptNo());
		model.addAttribute("clist", clist);
		model.addAttribute("pagingInfo", pagingInfo);

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
