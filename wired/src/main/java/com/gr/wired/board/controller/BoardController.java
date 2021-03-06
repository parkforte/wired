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
import com.gr.wired.common.BSearchVO;
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
		logger.info("????????? ?????? ??????, bdlistNo={}", bdlistNo);
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

		logger.info("????????? ??????, ???????????? memId={}", memId);
		logger.info("?????????, ???????????? vo={}", memNo);
		logger.info("????????? ??????, ???????????? vo={}", boardVo);

		//?????? ????????? ??????
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

			logger.info("?????? ????????? ??????, fileName={}", fileName);

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
		logger.info("????????? ?????? ??????, cnt={}", cnt);
		//3

		//4
		return "redirect:/board/boardList?bdlistNo="+boardVo.getBdlistNo();
	}

	@RequestMapping("/boardList")
	public String list(@ModelAttribute BSearchVO searchVo
			,@RequestParam(defaultValue = "0") int bdlistNo, Model model) {
		// ???????????? ????????????
		BoardVO boardVo = new BoardVO();
		boardVo.setBdlistNo(bdlistNo);
		logger.info("????????? ?????? ????????? ????????????, bdListNo={}", bdlistNo);

		searchVo.setBdlistNo(bdlistNo);
		//[1] paginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//[2] searchVo??? ??? ??????
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("??? ?????? ??? searchVo={}", searchVo);

		//db??????
		List<Map<String,Object>> list = boardService.selectByBNoList(searchVo);
		logger.info("????????? ?????? list={}", list);

		BdListVO bdListVo = bdlistService.selectByBdNo(bdlistNo);
		logger.info("bdListVo={}", bdListVo);

		//[3] totalPage
		int totalRecord=boardService.selectTotalRecord(searchVo);
		logger.info("totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		// ????????? ????????????
		model.addAttribute("list", list);
		model.addAttribute("bdListVo", bdListVo);
		model.addAttribute("pagingInfo", pagingInfo);
		// ??????????????????
		return "board/boardList";
	}


	@RequestMapping("/boardDetail")
	public String detail(@RequestParam(defaultValue = "0") int boardNo, @RequestParam(defaultValue = "0")int bdlistNo,
			HttpServletRequest request, Model model) {
		//1
		logger.info("????????? ????????? ??????, ???????????? boardNo={}", boardNo);
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
		//1 ???????????? ????????????
		String memId=(String)session.getAttribute("memId");
		logger.info("?????? ??????, ???????????? replyVo={}", replyVo);
		replyVo.setMemNo(replyService.selectById(memId));
		//2 db
		int cnt=replyService.insertReply(replyVo);
		if(cnt>0) {
			logger.info("?????? ?????? ??????!");
		}

		BdListVO bdListVo = bdlistService.selectByBdNo(bdlistNo);
		logger.info("bdListVo={}", bdListVo);
		//3 ????????? ????????????
		model.addAttribute("bdListVo", bdListVo);
		//4 ???????????? ??????
		return "redirect:/board/boardDetail?boardNo="+replyVo.getBoardNo()+"&bdlistNo="+bdlistNo;
	}

	@RequestMapping("/download")
	public ModelAndView download(@RequestParam(defaultValue = "0") int boardNo,
			@RequestParam String boardFilename, HttpServletRequest request) {
		logger.info("?????????????????? ?????????, ???????????? boardNo={}, boardFilename={}", boardNo, boardFilename);

		int cnt=boardService.updateDownCount(boardNo);
		logger.info("???????????? ??? ?????? ?????? cnt={}", cnt);

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
		logger.info("????????? ???????????? ??????, ???????????? boardNo={}",boardNo);

		BoardVO boardVo = boardService.selectByNo(boardNo);
		logger.info("????????? ????????????, boardVo={}", boardVo);

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
		logger.info("????????? ????????????, ???????????? boardVo={}", boardVo);

		//????????? ??????
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
			logger.info("????????? ???????????? ??????");

			//?????? ??????????????? ??????, ??????????????? ????????? ???????????? ????????????
			if(fileName!=null && fileName.isEmpty() && oldFileName!=null && oldFileName.isEmpty()) {
				String upPath=fileUploadUtil.getUploadPath(ConstUtil.UPLOAD_FILE_FLAG, request);
				File oldFile = new File(upPath, oldFileName);
				if(oldFile.exists()) {
					boolean bool = oldFile.delete();
					logger.info("?????????, ??????????????????:{}", bool);
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
		logger.info("????????? ??????,???????????? boardNo={}",boardNo);
		logger.info("bdlistNo={}", bdlistNo);
		if(boardNo==0) {
			model.addAttribute("msg", "????????? url?????????.");
			model.addAttribute("url", "/index");

			return "common/message";
		}
		int cnt=boardService.updateReadCount(boardNo);
		logger.info("????????? ?????? ??????, cnt={]",cnt);

		return "redirect:/board/boardDetail?boardNo="+boardNo+"&bdlistNo="+bdlistNo;

	}

	@RequestMapping("/recommend")
	public String updateRecommend(@RequestParam(defaultValue = "0") int boardNo, @RequestParam(defaultValue = "0")int bdlistNo
			, Model model) {
		logger.info("????????? ??????,???????????? boardNo={}",boardNo);
		if(boardNo==0) {
			model.addAttribute("msg", "????????? url?????????.");
			model.addAttribute("url", "/index");

			return "common/message";
		}
		BdListVO bdListVo = bdlistService.selectByBdNo(bdlistNo);
		logger.info("bdListVo={}", bdListVo);

		int cnt=boardService.updateRecommend(boardNo);
		logger.info("????????? ?????? ??????, cnt={]",cnt);

		model.addAttribute("bdListVo", bdListVo);

		return "redirect:/board/boardDetail?boardNo="+boardNo+"&bdlistNo="+bdlistNo;

	}

	@PostMapping("/boardDelete")
	public String Delete(@ModelAttribute BoardVO boardVo) {
		logger.info("????????? ??????, ???????????? boardNo={}", boardVo);

		int cnt=boardService.deleteBoard(boardVo.getBoardNo());
		logger.info("??? ?????? ??????,???????????? cnt={}", cnt);

		return "redirect:/board/boardList?bdlistNo="+boardVo.getBdlistNo();
	}

	@PostMapping("/boardReply")
	@Transactional
	public String reply_post(@ModelAttribute ReplyVO replyVo, @RequestParam(defaultValue = "0") int bdlistNo, Model model) {
		// ???????????? ????????????
		logger.info("????????? ??????, ???????????? replyVo={}", replyVo);
		// db
		// ?????? ??????
		int cnt = replyService.updateSortNo(replyVo);
		logger.info("?????? ?????? ???????????? ?????? cnt={}", cnt);
		//????????????
		cnt = replyService.reply(replyVo);
		logger.info("????????? ???????????? cnt={}",cnt);

		BdListVO bdListVo = bdlistService.selectByBdNo(bdlistNo);
		logger.info("bdListVo={}", bdListVo);

		//????????? ????????????
		model.addAttribute("bdlistVo", bdListVo);
		//???????????? ??????
		return "redirect:/board/boardDetail?boardNo="+replyVo.getBoardNo()+"&bdlistNo="+bdlistNo;
	}

	@RequestMapping("/deleteMulti")
	public String deleteMulti(@ModelAttribute BoardListVO boardListVo, @RequestParam(defaultValue = "0") int  bdlistNo,
			HttpServletRequest request, Model model) {
		logger.info("????????? ????????? ??????, ???????????? boardListVo={}", boardListVo);

		List<BoardVO> list=boardListVo.getBoardItems();
		int cnt=boardService.deleteMulti(list);
		logger.info("????????? ????????? ?????? ??????, cnt={}", cnt);

		String msg="????????? ???????????? ???????????? ???????????????.", url="/board/boardList?bdlistNo="+bdlistNo;
		if(cnt>0) {
			msg="????????? ???????????? ?????????????????????.";

			for(int i=0;i<list.size();i++) {
				BoardVO vo = list.get(i);
				logger.info("i={}, boardNo= {}, boardFileName={}", i, vo.getBoardNo(), vo.getBoardFilename());

				//?????? ??????
				int boardNo=vo.getBoardNo();
				if(boardNo!=0) {
					String upPath
					= fileUploadUtil.getUploadPath(ConstUtil.UPLOAD_FILE_FLAG, request);
					File file = new File(upPath, vo.getBoardFilename());
					if(file.exists()) {
						boolean bool = file.delete();
						logger.info("?????? ?????? ??????:{}", bool);
					}
				}
			}//for
		}//if
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}





}




























