package com.gr.wired.webHard.controller;

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
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gr.wired.board.model.BoardVO;
import com.gr.wired.common.BSearchVO;
import com.gr.wired.common.ConstUtil;
import com.gr.wired.common.FileUploadUtil;
import com.gr.wired.common.PaginationInfo;
import com.gr.wired.webHard.model.WebHardListVO;
import com.gr.wired.webHard.model.WebHardService;
import com.gr.wired.webHard.model.WebHardVO;

@Controller
@RequestMapping("/webHard")
public class WebHardController {
	private static final Logger logger = LoggerFactory.getLogger(WebHardController.class);
	private final WebHardService webHardService;
	private final FileUploadUtil fileUploadUtil;

	@Autowired
	public WebHardController(WebHardService webHardService, FileUploadUtil fileUploadUtil) {
		this.webHardService = webHardService;
		this.fileUploadUtil = fileUploadUtil;
	}

	@RequestMapping("/webHardList")
	public String list(@ModelAttribute BSearchVO searchVo, HttpSession session, Model model) {
		int memNo=(int)session.getAttribute("memNo");
		logger.info("memNo={}",memNo);

		searchVo.setMemNo(memNo);
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
		Map<String, Object> memmap=webHardService.selectByMemNo(memNo);
		logger.info("memmap={}",memmap);

		List<WebHardVO> fList= webHardService.selectFile(searchVo);

		//[3] totalPage
		int totalRecord=webHardService.myTotal(searchVo);
		logger.info("totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("fList", fList);
		model.addAttribute("memmap", memmap);
		model.addAttribute("pagingInfo", pagingInfo);

		return "webHard/webHardList";
	}

	@PostMapping("/webHardWrite")
	public String write(@ModelAttribute WebHardVO webHardVo, HttpServletRequest request) {
		//1
		logger.info("?????? ?????????, ???????????? webHardVo={}", webHardVo);

		String fileName="", originName="";
		long fileSize=0;
		int pathFlag=ConstUtil.UPLOAD_FILE_FLAG;

		try {
			List<Map<String, Object>> fileList
				=fileUploadUtil.fileUpload(request, pathFlag);
			logger.info("fileList.size={}", fileList.size());
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

		webHardVo.setFileName(fileName);
		webHardVo.setFileOriginalfilename(originName);
		webHardVo.setFileFilesize(fileSize);

		int cnt = webHardService.insertMyFile(webHardVo);
		logger.info("?????? ????????? ?????? ??????, cnt={}", cnt);
		//3

		//4
		return "redirect:/webHard/webHardList";
	}

	@RequestMapping("/webHardComList")
	public String ComList(@ModelAttribute BSearchVO searchVo, HttpSession session, Model model) {
		int memNo=(int)session.getAttribute("memNo");
		logger.info("memNo={}",memNo);

		//[1] paginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//[2] searchVo??? ??? ??????
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("??? ?????? ??? searchVo={}", searchVo);


		Map<String, Object> memmap=webHardService.selectByMemNo(memNo);
		logger.info("memmap={}",memmap);

		List<WebHardVO> fList= webHardService.allFile(searchVo);

		//[3] totalPage
		int totalRecord=webHardService.comTotal(searchVo);
		logger.info("totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("fList", fList);
		model.addAttribute("memmap", memmap);
		model.addAttribute("pagingInfo", pagingInfo);

		return "webHard/webHardComList";
	}

	@PostMapping("/webHardComWrite")
	public String ComWrite(@ModelAttribute WebHardVO webHardVo, HttpServletRequest request) {
		//1
		logger.info("?????? ?????????, ???????????? webHardVo={}", webHardVo);

		String fileName="", originName="";
		long fileSize=0;
		int pathFlag=ConstUtil.UPLOAD_FILE_FLAG;

		try {
			List<Map<String, Object>> fileList
				=fileUploadUtil.fileUpload(request, pathFlag);
			logger.info("fileList.size={}", fileList.size());
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

		webHardVo.setFileName(fileName);
		webHardVo.setFileOriginalfilename(originName);
		webHardVo.setFileFilesize(fileSize);

		int cnt = webHardService.insertFile(webHardVo);
		logger.info("?????? ????????? ?????? ??????, cnt={}", cnt);
		//3

		//4
		return "redirect:/webHard/webHardComList";
	}

	@RequestMapping("/download")
	public ModelAndView download(@RequestParam(defaultValue = "0") int fileNo,
			@RequestParam String fileName, HttpServletRequest request) {
		logger.info("?????? ???????????? ?????????, ???????????? fileNo={}, fileName={}", fileNo, fileName);

		int cnt=webHardService.updateDownCount(fileNo);
		logger.info("???????????? ??? ?????? ?????? cnt={}",cnt);

		String upPath = fileUploadUtil.getUploadPath(ConstUtil.UPLOAD_FILE_FLAG, request);

		File file=new File(upPath, fileName);

		Map<String, Object> map = new HashMap<>();
		map.put("file", file);

		ModelAndView mav = new ModelAndView("webHardDownloadView", map);

		return mav;
	}

	@RequestMapping("/downMulti")
	public ModelAndView multiDownload(@ModelAttribute WebHardListVO webHardListVo,
			HttpServletRequest request, Model model) {
		logger.info("????????? ?????? ????????????, ???????????? webHardListVo={}", webHardListVo);

		int cnt=0;
		List<WebHardVO> list= webHardListVo.getWebHardItems();

		ModelAndView mav=null;
		for(int i=0;i<list.size();i++) {
			WebHardVO vo = list.get(i);
			logger.info("i={}, fileNo={}, fileFilename={}", i, vo.getFileNo(), vo.getFileName());

			//?????? ??????
			int fileNo=vo.getFileNo();
			if(fileNo!=0) {
				int res=webHardService.updateDownCount(fileNo);
				logger.info("???????????? ??? ?????? ?????? res={}",res);

				String upPath = fileUploadUtil.getUploadPath(ConstUtil.UPLOAD_FILE_FLAG, request);

				File file=new File(upPath, vo.getFileName());

				Map<String, Object> map = new HashMap<>();
				map.put("file", file);

				mav = new ModelAndView("webHardDownloadView", map);
			}
		}

		mav.addObject(mav);

		return mav;

	}

	@RequestMapping("/deleteMulti")
	public String deleteMulti(@ModelAttribute WebHardListVO webHardListVo, HttpServletRequest request,
			Model model) {
		logger.info("????????? ????????? ??????, ???????????? webHardListVo={}", webHardListVo);

		List<WebHardVO> list = webHardListVo.getWebHardItems();
		int cnt=webHardService.deleteMulti(list);
		logger.info("????????? ????????? ?????? ??????, cnt={}", cnt);

		String msg="????????? ???????????? ???????????? ???????????????.", url="/webHard/webHardList";
		if(cnt>0) {
			msg="????????? ???????????? ?????????????????????.";

			for(int i=0;i<list.size();i++) {
				WebHardVO vo=list.get(i);
				logger.info("i={}, fileNo={}, fileName={}", i, vo.getFileNo(), vo.getFileName());

				//?????? ??????
				int fileNo=vo.getFileNo();
				if(fileNo!=0) {
					String upPath
					=fileUploadUtil.getUploadPath(ConstUtil.UPLOAD_FILE_FLAG, request);
					File file = new File(upPath, vo.getFileName());
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
