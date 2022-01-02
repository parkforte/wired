package com.gr.wired.bdList.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gr.wired.bdList.model.BdListService;
import com.gr.wired.common.ConstUtil;
import com.gr.wired.common.PaginationInfo;

@Controller
@RequestMapping("/bdList")
public class BdListController {
	private static final Logger logger
		=LoggerFactory.getLogger(BdListController.class);

	private final BdListService bdListService;

	@Autowired
	public BdListController(BdListService bdListService) {
		this.bdListService = bdListService;
	}

	@RequestMapping("/bdListmanagement")
	public String mainlist(@RequestParam(defaultValue = "1") int curPage,Model model) {
		//1. 파라미터 읽어오기
		logger.info("관리자 게시판목록 화면");

		//[1] paginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(curPage);
		logger.info("BlockSize={}, RecordCountPerPage={}, currentPage={}", pagingInfo.getBlockSize(), pagingInfo.getRecordCountPerPage(), pagingInfo.getCurrentPage());
		logger.info("firstPage={}", pagingInfo.getFirstPage());
		//2. db
		List<Map<String, Object>> list=bdListService.selectBdList();
		logger.info("관리자 게시판 목록 list,={}", list);

		//[2] totalPage
		int totalRecord=bdListService.selectTotalRecord();
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("totalRecord={}", totalRecord);

		//3. 모델에 결과저장
		model.addAttribute("bdList", list);
		model.addAttribute("pagingInfo", pagingInfo);
		//4. 뷰페이지 리턴
		return "bdList/bdListmanagement";
	}
}
