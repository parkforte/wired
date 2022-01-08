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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gr.wired.board.model.BoardDAO;
import com.gr.wired.board.model.BoardService;
import com.gr.wired.board.model.BoardVO;
import com.gr.wired.common.ConstUtil;
import com.gr.wired.common.FileUploadUtil;
import com.gr.wired.common.PaginationInfo;
import com.gr.wired.common.SearchVO;
import com.gr.wired.reply.model.ReplyService;
import com.gr.wired.reply.model.ReplyVO;

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
			HttpServletRequest request, HttpSession session) {
		//1
		String memId=(String) session.getAttribute("memId");
		int memNo= boardService.selectByMemId(memId);
		boardVo.setMemNo(memNo);

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
		Map<String, Object> boardVo = boardService.selectByNo(boardNo);
		logger.info("boardVo={}", boardVo);

		List<Map<String, Object>> list = replyService.selectAll(boardNo);
		logger.info("list={}",list.size());
		//3
		model.addAttribute("boardVo", boardVo);
		model.addAttribute("reList", list);
		//4
		return "board/boardDetail";
	}

	@PostMapping("/boardDetail")
	public String reWrite(@ModelAttribute ReplyVO replyVo, HttpSession session) {
		//1 파라미터 읽어오기
		String memId=(String)session.getAttribute("memId");
		logger.info("댓글 달기, 파라미터 replyVo={}", replyVo);
		replyVo.setMemNo(replyService.selectById(memId));
		//2 db
		int cnt=replyService.insertReply(replyVo);
		if(cnt>0) {
			logger.info("댓글 작성 성공!");
		}
		//3 모델에 결과저장

		//4 뷰페이지 리턴
		return "redirect:/board/boardDetail?boardNo="+replyVo.getBoardNo();
	}

	@GetMapping("/boardUpdate")
	public String boardUpdate(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		logger.info("게시글 업데이트 화면, 파라미터 boardNo={}",boardNo);

		Map<String, Object> boardVo = boardService.selectByNo(boardNo);
		logger.info("게시글 업데이트, boardVo={}", boardVo);

		model.addAttribute("boardVo", boardVo);

		return "board/boardUpdate";
	}

	@PostMapping("/boardUpdate")
	public String boardUpdate_post(@ModelAttribute BoardVO boardVo) {
		//1
		logger.info("게시글 업데이트, 파라미터 boardVo={}", boardVo);
		//2
		int cnt=boardService.updateBoard(boardVo);
		if(cnt>0) {
			logger.info("게시글 업데이트 성공");
		}
		//3

		//4
		return "redirect:/board/boardDetail?boardNo="+boardVo.getBoardNo();
	}

	@RequestMapping("/readCount")
	public String updateReadCount(@RequestParam(defaultValue = "0") int boardNo,@RequestParam(defaultValue = "0") int bdlistNo
			, Model model) {
		logger.info("조회수 증가,파라미터 boardNo={}",boardNo);
		logger.info("bdlistNo={}", bdlistNo);
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/index");

			return "common/message";
		}
		int cnt=boardService.updateReadCount(boardNo);
		logger.info("조회수 증가 결과, cnt={]",cnt);

		return "redirect:/board/boardDetail?boardNo="+boardNo+"&bdlistNo="+bdlistNo;

	}

	@RequestMapping("/recommend")
	public String updateRecommend(@RequestParam(defaultValue = "0") int boardNo, Model model) {
		logger.info("추천수 증가,파라미터 boardNo={}",boardNo);
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/index");

			return "common/message";
		}

		int cnt=boardService.updateRecommend(boardNo);
		logger.info("조회수 증가 결과, cnt={]",cnt);

		return "redirect:/board/boardDetail?boardNo="+boardNo;

	}

	@PostMapping("/boardDelete")
	public String Delete(@ModelAttribute BoardVO boardVo) {
		logger.info("게시글 삭제, 파라미터 boardNo={}", boardVo);

		int cnt=boardService.deleteBoard(boardVo);
		logger.info("글 삭제 결과,파라미터 cnt={}", cnt);

		return "redirect:/board/boardList?bdlistNo="+boardVo.getBdlistNo();
	}

	@PostMapping("/boardReply")
	@Transactional
	public String reply_post(@ModelAttribute ReplyVO replyVo) {
		// 파라미터 읽어오기
		logger.info("대댓글 등록, 파라미터 replyVo={}", replyVo);
		// db
		// 솔트 증가
		int cnt = replyService.updateSortNo(replyVo);
		logger.info("댓글 솔트 업데이트 결과 cnt={}", cnt);
		//댓글등록
		cnt = replyService.reply(replyVo);
		logger.info("대댓글 등록결과 cnt={}",cnt);

		//모델에 결과저장

		//뷰페이지 리턴
		return "redirect:/board/boardDetail?boardNo="+replyVo.getBoardNo();
	}


}
