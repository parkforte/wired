package com.gr.wired.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import com.gr.wired.bdList.model.BdListService;
import com.gr.wired.bdList.model.BdListVO;
import com.gr.wired.board.model.BoardListVO;
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
	private final BdListService bdlistService;
	private final ReplyService replyService;
	private final FileUploadUtil fileUploadUtil;

	@Autowired
	public BoardController(BoardService boardService, BdListService bdlistService, ReplyService replyService,
			FileUploadUtil fileUploadUtil) {
	this.boardService = boardService;
		this.bdlistService = bdlistService;
		this.replyService = replyService;
		this.fileUploadUtil = fileUploadUtil;
	}

	@RequestMapping("/boardWrite")
	public String write_get(@RequestParam(defaultValue = "0") int bdlistNo, Model model) {
		logger.info("게시글 등록 화면, bdlistNo={}", bdlistNo);
		BdListVO bdListVo = bdlistService.selectByBdNo(bdlistNo);
		logger.info("bdListVo={}", bdListVo);

		model.addAttribute("bdListVo", bdListVo);
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
		BoardVO boardVo = new BoardVO();
		boardVo.setBdlistNo(bdlistNo);
		logger.info("게시글 목록 페이지 파라티터, bdListNo={}", bdlistNo);

		searchVo.setBdlistNo(bdlistNo);
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
		List<Map<String,Object>> list = boardService.selectByBNoList(searchVo);
		logger.info("게시글 목록 list={}", list);

		BdListVO bdListVo = bdlistService.selectByBdNo(bdlistNo);
		logger.info("bdListVo={}", bdListVo);

		//[3] totalPage
		int totalRecord=boardService.selectTotalRecord(bdlistNo);
		logger.info("totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		// 모델에 결과저장
		model.addAttribute("list", list);
		model.addAttribute("bdListVo", bdListVo);
		model.addAttribute("pagingInfo", pagingInfo);
		// 뷰페이지리턴
		return "board/boardList";
	}


	@RequestMapping("/boardDetail")
	public String detail(@RequestParam(defaultValue = "0") int boardNo, @RequestParam(defaultValue = "0")int bdlistNo,
			HttpServletRequest request, Model model) {
		//1
		logger.info("게시글 디테일 화면, 파라미터 boardNo={}", boardNo);
		//2
		BoardVO boardVo = boardService.selectByNo(boardNo);
		logger.info("boardVo={}", boardVo);

		BdListVO bdListVo = bdlistService.selectByBdNo(bdlistNo);
		logger.info("bdListVo={}", bdListVo);

		String fileInfo
		= fileUploadUtil.getFileInfo(boardVo.getBoardOriginalfilename(), boardVo.getBoardFilesize(), request);

		List<Map<String, Object>> list = replyService.selectAll(boardNo);
		logger.info("list={}",list.size());
		//3
		model.addAttribute("boardVo", boardVo);
		model.addAttribute("bdListVo", bdListVo);
		model.addAttribute("reList", list);
		model.addAttribute("fileInfo", fileInfo);
		//4
		return "board/boardDetail";
	}

	@PostMapping("/boardDetail")
	public String reWrite(@ModelAttribute ReplyVO replyVo, @RequestParam(defaultValue = "0") int bdlistNo, HttpSession session,Model model) {
		//1 파라미터 읽어오기
		String memId=(String)session.getAttribute("memId");
		logger.info("댓글 달기, 파라미터 replyVo={}", replyVo);
		replyVo.setMemNo(replyService.selectById(memId));
		//2 db
		int cnt=replyService.insertReply(replyVo);
		if(cnt>0) {
			logger.info("댓글 작성 성공!");
		}

		BdListVO bdListVo = bdlistService.selectByBdNo(bdlistNo);
		logger.info("bdListVo={}", bdListVo);
		//3 모델에 결과저장
		model.addAttribute("bdListVo", bdListVo);
		//4 뷰페이지 리턴
		return "redirect:/board/boardDetail?boardNo="+replyVo.getBoardNo()+"&bdlistNo="+bdlistNo;
	}

	@RequestMapping("/download")
	public ModelAndView download(@RequestParam(defaultValue = "0") int boardNo,
			@RequestParam String boardFilename, HttpServletRequest request) {
		logger.info("파일다운로드 페이지, 파라미터 boardNo={}, boardFilename={}", boardNo, boardFilename);

		int cnt=boardService.updateDownCount(boardNo);
		logger.info("다운로드 수 등가 결과 boardNo={}", boardNo);

		String upPath = fileUploadUtil.getUploadPath(ConstUtil.UPLOAD_FILE_FLAG, request);

		File file = new File(upPath, boardFilename);

		Map<String, Object> map = new HashMap<>();
		map.put("file", file);

		ModelAndView mav = new ModelAndView("boardDownloadView", map);

		return mav;
	}



	@GetMapping("/boardUpdate")
	public String boardUpdate(@RequestParam(defaultValue = "0") int boardNo,
			HttpServletRequest request, Model model) {
		logger.info("게시글 업데이트 화면, 파라미터 boardNo={}",boardNo);

		BoardVO boardVo = boardService.selectByNo(boardNo);
		logger.info("게시글 업데이트, boardVo={}", boardVo);

		BdListVO bdListVo = bdlistService.selectByBdNo(boardVo.getBdlistNo());
		logger.info("bdListVo={}", bdListVo);

		String fileInfo = fileUploadUtil.getFileInfo(boardVo.getBoardOriginalfilename(), boardVo.getBoardFilesize(), request);

		model.addAttribute("bdListVo", bdListVo);
		model.addAttribute("boardVo", boardVo);
		model.addAttribute("fileInfo", fileInfo);

		return "board/boardUpdate";
	}

	@PostMapping("/boardUpdate")
	public String boardUpdate_post(@ModelAttribute BoardVO boardVo, @RequestParam String oldFileName, @RequestParam(defaultValue = "0") int bdlistNo,
			HttpServletRequest request, Model model) {
		//1
		logger.info("게시글 업데이트, 파라미터 boardVo={}", boardVo);

		//업로드 처리
		String fileName="";
		try {
			List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_FILE_FLAG);

			for(Map<String, Object> fileMap : fileList) {
				fileName=(String) fileMap.get("fileName");
				boardVo.setBoardFilename(fileName);
				boardVo.setBoardOriginalfilename((String)fileMap.get("originalFileName"));
				boardVo.setBoardFilesize((Long)fileMap.get("fileSize"));
			}//for
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//2
		int cnt=boardService.updateBoard(boardVo);
		if(cnt>0) {
			logger.info("게시글 업데이트 성공");

			//새로 업로드하는 경우, 기존파일이 있다면 기존파일 삭제처리
			if(fileName!=null && fileName.isEmpty() && oldFileName!=null && oldFileName.isEmpty()) {
				String upPath=fileUploadUtil.getUploadPath(ConstUtil.UPLOAD_FILE_FLAG, request);
				File oldFile = new File(upPath, oldFileName);
				if(oldFile.exists()) {
					boolean bool = oldFile.delete();
					logger.info("글수정, 파일삭제여부:{}", bool);
				}
			}
		}
		BdListVO bdListVo = bdlistService.selectByBdNo(bdlistNo);
		logger.info("bdListVo={}", bdListVo);

		//3
		model.addAttribute("bdListVo", bdListVo);

		//4
		return "redirect:/board/boardDetail?boardNo="+boardVo.getBoardNo()+"&bdlistNo="+bdlistNo;
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
	public String updateRecommend(@RequestParam(defaultValue = "0") int boardNo, @RequestParam(defaultValue = "0")int bdlistNo
			, Model model) {
		logger.info("추천수 증가,파라미터 boardNo={}",boardNo);
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/index");

			return "common/message";
		}
		BdListVO bdListVo = bdlistService.selectByBdNo(bdlistNo);
		logger.info("bdListVo={}", bdListVo);

		int cnt=boardService.updateRecommend(boardNo);
		logger.info("조회수 증가 결과, cnt={]",cnt);

		model.addAttribute("bdListVo", bdListVo);

		return "redirect:/board/boardDetail?boardNo="+boardNo+"&bdlistNo="+bdlistNo;

	}

	@PostMapping("/boardDelete")
	public String Delete(@ModelAttribute BoardVO boardVo) {
		logger.info("게시글 삭제, 파라미터 boardNo={}", boardVo);

		int cnt=boardService.deleteBoard(boardVo.getBoardNo());
		logger.info("글 삭제 결과,파라미터 cnt={}", cnt);

		return "redirect:/board/boardList?bdlistNo="+boardVo.getBdlistNo();
	}

	@PostMapping("/boardReply")
	@Transactional
	public String reply_post(@ModelAttribute ReplyVO replyVo, @RequestParam(defaultValue = "0") int bdlistNo, Model model) {
		// 파라미터 읽어오기
		logger.info("대댓글 등록, 파라미터 replyVo={}", replyVo);
		// db
		// 솔트 증가
		int cnt = replyService.updateSortNo(replyVo);
		logger.info("댓글 솔트 업데이트 결과 cnt={}", cnt);
		//댓글등록
		cnt = replyService.reply(replyVo);
		logger.info("대댓글 등록결과 cnt={}",cnt);

		BdListVO bdListVo = bdlistService.selectByBdNo(bdlistNo);
		logger.info("bdListVo={}", bdListVo);

		//모델에 결과저장
		model.addAttribute("bdlistVo", bdListVo);
		//뷰페이지 리턴
		return "redirect:/board/boardDetail?boardNo="+replyVo.getBoardNo()+"&bdlistNo="+bdlistNo;
	}

	@RequestMapping("/deleteMulti")
	public String deleteMulti(@ModelAttribute BoardListVO boardListVo, @RequestParam(defaultValue = "0") int  bdlistNo,
			HttpServletRequest request, Model model) {
		logger.info("선택한 게시글 삭제, 파라미터 boardListVo={}", boardListVo);

		List<BoardVO> list=boardListVo.getBoardItems();
		int cnt=boardService.deleteMulti(list);
		logger.info("선택한 게시글 삭제 결과, cnt={}", cnt);

		String msg="선택한 게시글을 삭제하지 못했습니다.", url="/board/boardList?bdlistNo="+bdlistNo;
		if(cnt>0) {
			msg="선택한 게시글을 삭제하였습니다.";

			for(int i=0;i<list.size();i++) {
				BoardVO vo = list.get(i);
				logger.info("i={}, boardNo= {}, boardFileName={}", i, vo.getBoardNo(), vo.getBoardFilename());

				//파일 삭제
				int boardNo=vo.getBoardNo();
				if(boardNo!=0) {
					String upPath
					= fileUploadUtil.getUploadPath(ConstUtil.UPLOAD_FILE_FLAG, request);
					File file = new File(upPath, vo.getBoardFilename());
					if(file.exists()) {
						boolean bool = file.delete();
						logger.info("파일 삭제 여부:{}", bool);
					}
				}
			}//for
		}//if
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}





}




























