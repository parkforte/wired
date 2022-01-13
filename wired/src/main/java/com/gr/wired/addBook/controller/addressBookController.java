package com.gr.wired.addBook.controller;

import java.util.List;
import java.util.Map;

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

import com.gr.wired.addBook.model.addressBookService;
import com.gr.wired.addBook.model.addressBookVO;
import com.gr.wired.common.ConstUtil;
import com.gr.wired.common.PaginationInfo;
import com.gr.wired.common.SearchVO;

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
		logger.info("연락처 등록 화면");
	}

	@PostMapping("/addressBookRegister")
	public String addbookJoin(@ModelAttribute addressBookVO vo, Model model) {
		logger.info("연락처 등록 처리, 파라미터 vo={}", vo);

		int cnt=addressBookService.insertAddressBook(vo);
		logger.info("연락처 등록 결과, cnt={}", cnt);	

		String msg="연락처 등록 실패", url="/index";
		if(cnt>0) {
			msg="연락처 등록 성공";
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

	@GetMapping("/addressBookEdit")
	public String addbookUpdate_get(@RequestParam(defaultValue = "0") int addrbookNo, Model model) {
		logger.info("연락처 수정 화면, 파라미터 addrbookNo={}",addrbookNo);
		
		addressBookVO addressBookVo = addressBookService.selectByAddNo(addrbookNo);
		logger.info("연락처 수정, addressBookVo={}", addressBookVo);

		model.addAttribute("addressBookVo", addressBookVo);

		return "addbook/addressBookEdit";
	}

	@PostMapping("/addressBookEdit")
	public String addbookUpdate_post(@ModelAttribute addressBookVO addressBookVo) {

		logger.info("연락처 수정, 파라미터 addressBookVo={}", addressBookVo);

		int cnt=addressBookService.updateAddressBook(addressBookVo);
		if(cnt>0) {
			logger.info("연락처 수정 성공");
		}

		return "redirect:/addbook/addressBookEdit?addrbookNo="+addressBookVo.getAddrbookNo();
	}
	
	@RequestMapping("/addressBookDelete")
	public String Delete(@RequestParam(defaultValue = "0")int addrbookNo) {
		logger.info("연락처 삭제, 파라미터 addrbookNo={}", addrbookNo);

		int cnt = addressBookService.deleteAddressBook(addrbookNo);
		logger.info("연락처 삭제 결과,파라미터 cnt={}", cnt);

		return "redirect:/addbook/addressBookList";
	}

}
