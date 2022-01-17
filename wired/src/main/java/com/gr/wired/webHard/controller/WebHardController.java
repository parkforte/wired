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

		//[2] searchVo에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("값 셋팅 후 searchVo={}", searchVo);

		//db작업
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
		logger.info("파일 업로드, 파라미터 webHardVo={}", webHardVo);

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

			logger.info("파일 업로드 성공, fileName={}", fileName);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		webHardVo.setFileName(fileName);
		webHardVo.setFileOriginalfilename(originName);
		webHardVo.setFileFilesize(fileSize);

		int cnt = webHardService.insertMyFile(webHardVo);
		logger.info("파일 업로드 처리 결과, cnt={}", cnt);
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

		//[2] searchVo에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("값 셋팅 후 searchVo={}", searchVo);


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
		logger.info("파일 업로드, 파라미터 webHardVo={}", webHardVo);

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

			logger.info("파일 업로드 성공, fileName={}", fileName);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		webHardVo.setFileName(fileName);
		webHardVo.setFileOriginalfilename(originName);
		webHardVo.setFileFilesize(fileSize);

		int cnt = webHardService.insertFile(webHardVo);
		logger.info("파일 업로드 처리 결과, cnt={}", cnt);
		//3

		//4
		return "redirect:/webHard/webHardComList";
	}

	@RequestMapping("/download")
	public ModelAndView download(@RequestParam(defaultValue = "0") int fileNo,
			@RequestParam String fileName, HttpServletRequest request) {
		logger.info("파일 다운로드 페이지, 파라미터 fileNo={}, fileName={}", fileNo, fileName);

		int cnt=webHardService.updateDownCount(fileNo);
		logger.info("다운로드 수 증가 결과 cnt={}",cnt);

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
		logger.info("선택한 파일 다운로드, 파라미터 webHardListVo={}", webHardListVo);

		int cnt=0;
		List<WebHardVO> list= webHardListVo.getWebHardItems();

		ModelAndView mav=null;
		for(int i=0;i<list.size();i++) {
			WebHardVO vo = list.get(i);
			logger.info("i={}, fileNo={}, fileFilename={}", i, vo.getFileNo(), vo.getFileName());

			//파일 다운
			int fileNo=vo.getFileNo();
			if(fileNo!=0) {
				int res=webHardService.updateDownCount(fileNo);
				logger.info("다운로드 수 증가 결과 res={}",res);

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
		logger.info("선택한 웹하드 삭제, 파라미터 webHardListVo={}", webHardListVo);

		List<WebHardVO> list = webHardListVo.getWebHardItems();
		int cnt=webHardService.deleteMulti(list);
		logger.info("선택한 췝하드 삭제 결과, cnt={}", cnt);

		String msg="선택한 웹하드를 삭제하지 못했습니다.", url="/webHard/webHardList";
		if(cnt>0) {
			msg="선택한 웹하드를 삭제하였습니다.";

			for(int i=0;i<list.size();i++) {
				WebHardVO vo=list.get(i);
				logger.info("i={}, fileNo={}, fileName={}", i, vo.getFileNo(), vo.getFileName());

				//파일 삭제
				int fileNo=vo.getFileNo();
				if(fileNo!=0) {
					String upPath
					=fileUploadUtil.getUploadPath(ConstUtil.UPLOAD_FILE_FLAG, request);
					File file = new File(upPath, vo.getFileName());
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
