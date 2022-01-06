package com.gr.wired.board.controller;

import java.io.IOException;
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

import com.gr.wired.board.model.BoardService;
import com.gr.wired.board.model.BoardVO;
import com.gr.wired.common.ConstUtil;
import com.gr.wired.common.FileUploadUtil;
import com.gr.wired.common.PaginationInfo;
import com.gr.wired.common.SearchVO;
import com.gr.wired.reply.model.ReplyService;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger
		=LoggerFactory.getLogger(BoardController.class);

	private final BoardService boardService;
	private final ReplyService replyService;
	private final FileUploadUtil fileUploadUtil;

	@Autowired
	public BoardController(BoardService boardService, ReplyService replyService, FileUploadUtil fileUploadUtil) {
		this.boardService = boardService;
		this.replyService = replyService;
		this.fileUploadUtil = fileUploadUtil;
	}

	@GetMapping("/boardWrite")
	public String write_get() {
		logger.info("게시글 등록 화면");

		return "board/boardWrite";
	}

	@PostMapping("/boardWrite")
	public String write_post(@ModelAttribute BoardVO boardVo,
			@RequestParam(defaultValue = "0") int bdlistNo,
			HttpServletRequest request, HttpSession session) {
		//1
		String memId=(String) session.getAttribute("memId");
		int memNo= boardService.selectByMemId(memId);
		boardVo.setMemNo(memNo);
		boardVo.setBdlistNo(1);
		logger.info("게시글 처리, 파라미터 memId={}", memId);
		logger.info("작성자, 파라미터 vo={}", memNo);
		logger.info("게시글 처리, 파라미터 vo={}", boardVo);

		//파일 업로드 처리
		String fileName="", originName="";
		long fileSize=0;
		int pathFlag=ConstUtil.UPLOAD_FILE_FLAG;

		try {
			List<Map<String, Object>> fileList
				=fileUploadUtil.fileUpload(request, pathFlag);
			for(int i=0;i<fileList.size();i++) {
				Map<String, Object> map=fileList.get(i);

				fileName=(String) map.get("fileName");
				originName=(String) map.get("originalFileName");
				fileSize=(long) map.get("fileSize");
			}

			logger.info("파일 업로드 성공, fileName={}", fileName);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//2
		boardVo.setBoardFilename(fileName);
		boardVo.setBoardOriginalfilename(originName);
		boardVo.setBoardFilesize(fileSize);

		int cnt=boardService.insertBoard(boardVo);
		logger.info("글쓰기 처리 결과, cnt={}", cnt);
		//3

		//4
		return "redirect:/board/boardList?bdlistNo="+boardVo.getBdlistNo();
	}

	@RequestMapping("/boardList")
	public String list(@ModelAttribute SearchVO searchVo
			,@RequestParam(defaultValue = "0") int bdlistNo, Model model) {
		// 파라미터 읽어오기
		logger.info("게시글 목록 페이지 파라티터, bdListNo={}", bdlistNo);

		//[1] paginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//[2] searchVo에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("값 셋팅 후 searchVo={}", searchVo);

		//db작업
		List<Map<String,Object>> list = boardService.selectByBNoList(bdlistNo);
		logger.info("게시글 목록 list={}", list);

		//[3] totalPage
		int totalRecord=boardService.selectTotalRecord(bdlistNo);
		logger.info("totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		// 모델에 결과저장
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		// 뷰페이지리턴
		return "board/boardList";
	}


	@RequestMapping("/boardDetail")
	public String detail(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		//1
		logger.info("게시글 디테일 화면, 파라미터 boardNo={}", boardNo);
		//2
		BoardVO boardVo = boardService.selectByNo(boardNo);
		logger.info("boardVo={}", boardVo);

		List<Map<String, Object>> list = replyService.selectAll(boardNo);
		logger.info("list={}",list.size());
		//3
		model.addAttribute("boardVo", boardVo);
		model.addAttribute("reList", list);
		//4
		return "board/boardDetail";
	}
}
