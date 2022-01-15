package com.gr.wired.commute.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import com.gr.wired.common.DateSearchVO;
import com.gr.wired.common.PaginationInfo;
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
	public String commuteList(@ModelAttribute DateSearchVO dateSearchVo, HttpSession session, Model model) {
		int memNo = (int) session.getAttribute("memNo");
		dateSearchVo.setMemNo(memNo);
		logger.info("개인 근태 조회 파라미터, memNo={}", dateSearchVo.getMemNo());

		String startDay=dateSearchVo.getStartDay();

		if(startDay==null || startDay.isEmpty()) {
			Date d = new Date();
			Calendar cal = Calendar.getInstance();
			cal.setTime(d);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			cal.add(Calendar.DATE, -7);
			String lastDay=sdf.format(cal.getTime());
			String today=sdf.format(d);
			dateSearchVo.setStartDay(lastDay);
			dateSearchVo.setEndDay(today);
		}
		logger.info("셋팅 후 주문내역 파라미터, dateSearchVo={}", dateSearchVo);

		//[1] paginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(dateSearchVo.getCurrentPage());

		//[2] searchVo에 값 셋팅
		dateSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		dateSearchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		logger.info("값 셋팅 후 dateSearchVo={}", dateSearchVo);

		List<Map<String, Object>> clist=commuteService.selectAll(dateSearchVo);
		logger.info("clist.size={}", clist.size());

		//[3] totalPage
		int totalRecord=commuteService.selectTotalRecord(dateSearchVo);
		logger.info("totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("clist", clist);
		model.addAttribute("pagingInfo", pagingInfo);

		return "commute/commuteList";
	}

	@RequestMapping("/commuteDList")
	public String commuteDList(@ModelAttribute DateSearchVO dateSearchVo, HttpSession session, Model model) {
		int memNo=(int) session.getAttribute("memNo");
		int deptNo=commuteService.selectDeNo(memNo);
		dateSearchVo.setDeptNo(deptNo);
		logger.info("부서별 근태 조회 파라미터, deptNo={}", dateSearchVo.getDeptNo());

		String startDay=dateSearchVo.getStartDay();

		if(startDay==null || startDay.isEmpty()) {
			Date d = new Date();
			Calendar cal = Calendar.getInstance();
			cal.setTime(d);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			cal.add(Calendar.DATE, -7);
			String lastDay=sdf.format(cal.getTime());
			String today=sdf.format(d);
			dateSearchVo.setStartDay(lastDay);
			dateSearchVo.setEndDay(today);
		}
		logger.info("셋팅 후 주문내역 파라미터, dateSearchVo={}", dateSearchVo);

		//[1] paginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(dateSearchVo.getCurrentPage());

		//[2] searchVo에 값 셋팅
		dateSearchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		dateSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("값 셋팅 후 searchVo={}", dateSearchVo);

		List<Map<String, Object>> clist=commuteService.selectAll(dateSearchVo);
		logger.info("clist.size={}", clist.size());

		//[3] totalPage
		int totalRecord=commuteService.selectTotalRecord(dateSearchVo);
		logger.info("totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("deptNo", dateSearchVo.getDeptNo());
		model.addAttribute("clist", clist);
		model.addAttribute("pagingInfo", pagingInfo);

		return "commute/commuteDList";
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
