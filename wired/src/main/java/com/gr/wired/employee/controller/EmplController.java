package com.gr.wired.employee.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.gr.wired.common.ConstUtil;
import com.gr.wired.common.PaginationInfo;
import com.gr.wired.common.SearchVO;
import com.gr.wired.employee.model.EmplService;
import com.gr.wired.employee.model.EmplVO;

@Controller
@RequestMapping("/employee")
public class EmplController {
	private static final Logger logger
	=LoggerFactory.getLogger(EmplController.class);

	private final EmplService emplService;

	@Autowired
	public EmplController(EmplService emplService) {
		this.emplService = emplService;
	}

	@RequestMapping("/emplRegister")
	public void emplInsert() {
		logger.info("사원등록 화면");
	}

	@PostMapping("/emplRegister")
	public String emplJoin(@ModelAttribute EmplVO vo, Model model) {
		logger.info("사원등록 처리, 파라미터 vo={}", vo);

		if(vo.getMemHp2()==null || vo.getMemHp2().isEmpty() || vo.getMemHp3()==null || vo.getMemHp3().isEmpty()) {
			vo.setMemHp1("");
			vo.setMemHp2("");
			vo.setMemHp3("");
		}

		int cnt=emplService.insertMember(vo);
		logger.info("사원등록 결과, cnt={}", cnt);

		String msg="사원등록 실패", url="/index";
		if(cnt>0) {
			msg="사원등록 성공";
			url="/employee/emplList";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}

	@RequestMapping("/emplList")
	public String emplAll(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("글목록, 파라미터 searchVo={}", searchVo);

		//[1] PaginationInfo 객체 생성 - 계산해줌
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//[2] searchVo에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("값 셋팅 후 searchVo={}", searchVo);

		List<Map<String, Object>> list=emplService.selectAll(searchVo);
		logger.info("전체조회 결과 list.size={}", list.size());

		//[3] totalRecord 구하기
		int totalRecord=emplService.selectTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);

		return "employee/emplList";
	}

	@GetMapping("/emplEdit")
	public String emplEdit_get(@RequestParam(defaultValue = "0") int memNo,
			Model model) {
		logger.info("사원정보 수정 화면, 파라미터 no={}", memNo);
		if(memNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/index");
			return "common/message";
		}

		Map<String, Object> map=emplService.selectByView(memNo);
		logger.info("사원수정 - 조회 결과 map={}", map);

		model.addAttribute("map", map);

		return "employee/emplEdit";
	}

	@PostMapping("/emplEdit")
	public String emplEdit_post(@ModelAttribute EmplVO vo,
			Model model) {
		logger.info("사원수정 처리, 파라미터 vo={}", vo);

		if(vo.getMemHp2()==null || vo.getMemHp2().isEmpty() ||
				vo.getMemHp3()==null || vo.getMemHp3().isEmpty()) {
			vo.setMemHp1("");
			vo.setMemHp2("");
			vo.setMemHp3("");
		}

		int cnt=emplService.updateMember(vo);
		logger.info("사원수정 결과, cnt={}", cnt);

		String msg="사원정보 수정 실패", url="/employee/emplEdit";
		if(cnt>0) {
			msg="사원정보 수정 완료";
			url="/employee/emplList";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/emplQuit")
	public String emplquit(@RequestParam(defaultValue = "0") int memNo,
			Model model) {
		logger.info("퇴사처리, 파라미터 memNo={}", memNo);

		int cnt=emplService.upResignMember(memNo);
		if(cnt>0) {
			logger.info("퇴사 처리 완료");
		}
		
		model.addAttribute("msg","퇴사처리 되었습니다.");
		model.addAttribute("url","/employee/emplList");
		
		return "common/message";
		
	}
	
	@RequestMapping("/emplResign")
	public String ResighList(Model model) {
		logger.info("퇴사자목록페이지");
		
		List<Map<String, Object>> list = emplService.resignMember();
		logger.info("퇴사목록, 조회 결과 list={}", list);

		model.addAttribute("list", list);

		return "employee/emplResign";
	}
	
	@RequestMapping("/emplBack")
	public String emplback(@RequestParam(defaultValue = "0") int memNo,
			Model model) {
		logger.info("복직처리, 파라미터 memNo={}", memNo);
		
		int cnt=emplService.upBackMember(memNo);
		if(cnt>0) {
			logger.info("복직 처리 완료");
		}
		
		model.addAttribute("msg", "복직처리 되었습니다.");
		model.addAttribute("url", "/employee/emplResign");
		
		return "common/message";
	}
}
