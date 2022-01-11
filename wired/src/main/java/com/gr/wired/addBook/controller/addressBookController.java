package com.gr.wired.addBook.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gr.wired.addBook.model.addressBookService;
import com.gr.wired.addBook.model.addressBookVO;
import com.gr.wired.common.ConstUtil;
import com.gr.wired.common.PaginationInfo;
import com.gr.wired.common.SearchVO;
import com.gr.wired.employee.model.EmplVO;

@Controller
@RequestMapping("/addbook")
public class addressBookController {
	private static final Logger logger
	=LoggerFactory.getLogger(addressBookController.class);

	private final addressBookService addressBookService;

	@Autowired
	public addressBookController(addressBookService addressBookService) {
		this.addressBookService = addressBookService;
	}

	@RequestMapping("/addressBookRegister")
	public void addbookInsert() {
		logger.info("사원등록 화면");
	}

	@PostMapping("/addressBookRegister")
	public String addbookJoin(@ModelAttribute addressBookVO vo, Model model) {
		logger.info("사원등록 처리, 파라미터 vo={}", vo);

		int cnt=addressBookService.insertAddressBook(vo);
		logger.info("사원등록 결과, cnt={}", cnt);

		String msg="사원등록 실패", url="/index";
		if(cnt>0) {
			msg="사원등록 성공";
			url="/addbook/addressBookList";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}

	@RequestMapping("/addressBookList")
	public String addbookAll(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("연락처 목록, 파라미터 searchVo={}", searchVo);

		//[1] PaginationInfo 객체 생성 - 계산해줌
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//[2] searchVo에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("값 셋팅 후 searchVo={}", searchVo);

		List<Map<String, Object>> list=addressBookService.selectAll(searchVo);
		logger.info("전체조회 결과 list.size={}", list.size());

		//[3] totalRecord 구하기
		int totalRecord=addressBookService.selectTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("addbookList", list);
		model.addAttribute("pagingInfo", pagingInfo);

		return "addbook/addressBookList";
	}

	@RequestMapping("/addressBookEdit")
	public String emplEdit() {
		return "addbook/addressBookEdit";
	}
}
