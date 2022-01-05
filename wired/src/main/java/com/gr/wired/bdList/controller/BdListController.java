package com.gr.wired.bdList.controller;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.gr.wired.bdList.model.BdListService;
import com.gr.wired.bdList.model.BdListVO;
import com.gr.wired.common.ConstUtil;
import com.gr.wired.common.PaginationInfo;
import com.gr.wired.common.SearchVO;

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
	public String bdlist(@ModelAttribute SearchVO searchVo, Model model) {
		//1. 파라미터 읽어오기
		logger.info("관리자 게시판목록 화면");

		//[1] paginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//[2] searchVo에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("값 셋팅 후 searchVo={}", searchVo);

		//2. db
		List<Map<String, Object>> list=bdListService.selectBdList(searchVo);
		logger.info("관리자 게시판 목록 list,={}", list.size());

		//[3] totalPage
		int totalRecord=bdListService.selectTotalRecord();
		logger.info("totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		List<Map<String, Object>> rlist = bdListService.selectRanks();
		logger.info("list={}", list);

		List<BdListVO> elist = bdListService.selectBdListE();

		model.addAttribute("ranksList", rlist);
		model.addAttribute("eList", elist);

		//3. 모델에 결과저장
		model.addAttribute("bdList", list);
		model.addAttribute("pagingInfo", pagingInfo);
		//4. 뷰페이지 리턴
		return "bdList/bdListmanagement";
	}

	@PostMapping("/bdListmanagement2")
	public String bdList_post(@ModelAttribute BdListVO bdListVo, @RequestParam(defaultValue = "0") int frmNum, Model model) {
		//1 파라미터 읽기

		String msg="게시판 등록 실패", url="/bdList/bdListmanagement";
		logger.info("게시판 생성, 파라미터 vo={}", bdListVo);
		logger.info("frmNum={}", frmNum);
		//2 db
		int cnt=0;
		if(frmNum==1) {
			cnt=bdListService.insertBdList(bdListVo);
			logger.info("게시판 생성, 결과 cnt={}", cnt);
			if(cnt>0) {
				msg="게시판 등록 성공!";
			}

		}else if(frmNum==2) {
			cnt=bdListService.updatebdList(bdListVo);
			logger.info("게시판 생성, 결과 cnt={}", cnt);
			if(cnt>0) {
				msg="게시판 수정 성공!";
			}

		}

		//3 모델에 결과저장
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4 뷰페이지 리턴
		return "common/message";
	}




}
