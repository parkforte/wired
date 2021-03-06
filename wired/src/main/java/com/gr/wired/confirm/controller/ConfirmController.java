package com.gr.wired.confirm.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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

import com.gr.wired.common.PaginationInfo;
import com.gr.wired.common.SearchVO;
import com.gr.wired.confirm.model.ConfirmLineService;
import com.gr.wired.confirm.model.ConfirmLineVO;
import com.gr.wired.confirm.model.ConfirmService;
import com.gr.wired.confirm.model.ConfirmVO;
import com.gr.wired.confirm.model.LineregService;
import com.gr.wired.confirm.model.LineregVO;
import com.gr.wired.docform.model.DocformService;
import com.gr.wired.docform.model.DocformVO;
import com.gr.wired.doctype.model.DoctypeService;
import com.gr.wired.doctype.model.DoctypeVO;
import com.gr.wired.employee.model.EmplService;
import com.gr.wired.employee.model.EmplVO;
import com.gr.wired.util.ConfirmUtil;
import com.gr.wired.util.Signature.SignatureConst;
import com.gr.wired.util.Signature.SignatureUploadUtil;

@Controller
@RequestMapping("/e-approval")
public class ConfirmController {

	private static Logger logger = LoggerFactory.getLogger(ConfirmController.class);

	private final ConfirmService confirmService;
	private final EmplService emplService;
	private final LineregService lineregService;
	private final ConfirmLineService confirmlineService;
	private final DocformService docformService;
	private final DoctypeService doctypeService;
	private final SignatureUploadUtil signatureUploadUtil;


	@Autowired
	public ConfirmController(ConfirmService confirmService, EmplService emplService, LineregService lineregService,
			ConfirmLineService confirmlineService, DocformService docformService, DoctypeService doctypeService,
			SignatureUploadUtil signatureUploadUtil) {
		super();
		this.confirmService = confirmService;
		this.emplService = emplService;
		this.lineregService = lineregService;
		this.confirmlineService = confirmlineService;
		this.docformService = docformService;
		this.doctypeService = doctypeService;
		this.signatureUploadUtil = signatureUploadUtil;
	}





	@RequestMapping("/docbox")
	public void docbox_get(@ModelAttribute ConfirmVO confirmVo ,HttpSession session, Model model) {
		int memNo =(int)session.getAttribute("memNo");
		logger.info("?????????! memNo={}, searchVo={}", memNo, confirmVo);

		//Paging
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConfirmUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ConfirmUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(confirmVo.getCurrentPage());

		confirmVo.setMemNo(memNo);
		confirmVo.setRecordCountPerPage(ConfirmUtil.RECORD_COUNT);
		confirmVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("?????? ??? searchVo={}", confirmVo);

		//DB
		List<ConfirmVO> list =confirmService.selectAll(confirmVo);
		logger.info("list.size={}", list.size());

		int totalRecord=confirmService.selectTotalRecord(confirmVo);
		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);

		}




	@RequestMapping("/signature/paint")
	public void signature_get() {
		logger.info("??????????????? ??????!");
	}

	@GetMapping("/confirm/confirmAdmin")
	public void confirmLinePage(HttpSession session,@RequestParam(defaultValue = "0") int regNo , Model model) {
		int memNo =(int)session.getAttribute("memNo");
		logger.info("??????????????? ??????! memNo={}, regNo={}", memNo, regNo);

		//DB
		List<LineregVO> lineregList= lineregService.SelectAllLinereg(memNo);
		//List<Map<String, Object>> confirmlineList= confirmlineService.selectALLRegNo(regNo);

		model.addAttribute("lineregList", lineregList);
		//model.addAttribute("confirmlineList", confirmlineList);


	}

	@PostMapping("/confirm/confirmAdmin")
	public String searchMember(@ModelAttribute EmplVO emplVo, @RequestParam(defaultValue = "0") int regNo, Model model) {
		logger.info("???????????? ???????????? ??? ?????? regNo={}, emplVo={}", regNo,emplVo);

		List<Map<String, Object>> emplList=emplService.selectByMemName(emplVo);
		logger.info("???????????? ??????, emplList.size={}", emplList.size());

		model.addAttribute("emplList", emplList);
		logger.info("emplList={}",emplList);

		String url="redirect:confirmAdmin?regNo="+regNo;

		return url;
	}



	@PostMapping("/confirm/addLine")
	public String addLine(@ModelAttribute LineregVO lineregVo, HttpSession session) {
		int memNo =(int)session.getAttribute("memNo");
		logger.info("??????????????? ?????? lineregVo={}, memNo={} ", lineregVo, memNo);

		lineregVo.setMemNo(memNo);
		//DB
		int result=lineregService.insertLinereg(lineregVo);
		if(result>0) {
			logger.info("??????????????? ?????? ??????! result={}", result);
		}

		return "redirect:/e-approval/confirm/confirmAdmin";

	}

	@GetMapping("/confirm/deleteLine")
	public String deleteLine(@RequestParam(defaultValue = "0") int regNo, Model model) {
		logger.info("???????????? ??????, regNo={}", regNo);

		//DB
		int result=lineregService.deleteLinereg(regNo);

		String msg="???????????? ?????? ??????!", url="/e-approval/confirm/confirmAdmin";
		if(result>0) {
			msg="???????????? ?????? ??????!";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}


	@GetMapping("/confirm/confirmLineDetail")
	public String lineDetail(@RequestParam(defaultValue = "0") int regNo, Model model) {
		logger.info("?????????????????? ??????????????? regNo={}", regNo);

		//DB
		List<Map<String, Object>> confirmlineList=confirmlineService.selectALLRegNo(regNo);

		model.addAttribute("confirmlineList", confirmlineList);
		logger.info("ConfirmLine ???????????? list.size={}", confirmlineList.size());

		return "e-approval/confirm/confirmLineDetail";

	}


	@PostMapping("/confirm/searchMember")
	public String addOrder(@ModelAttribute EmplVO emplVo, @RequestParam(defaultValue = "0") int regNo, Model model) {
		logger.info("????????????, emplVo={}, regNo={}", emplVo, regNo);

		List<Map<String, Object>> emplList=emplService.selectByMemName(emplVo);
		logger.info("???????????? ??????, emplList.size={}", emplList.size());

		List<Map<String, Object>> confirmlineList=confirmlineService.selectALLRegNo(regNo);

		model.addAttribute("confirmlineList", confirmlineList);
		logger.info("ConfirmLine ???????????? list.size={}", confirmlineList.size());


		model.addAttribute("emplList", emplList);
		logger.info("emplList={}",emplList);

		return "e-approval/confirm/confirmLineDetail";
	}

	@PostMapping("/confirm/addLineOrder")
	public String addLineOrder(@ModelAttribute ConfirmLineVO lineVo, Model model) {
		logger.info("???????????? ?????? lineVo={}", lineVo);

		//DB
		int result=confirmlineService.insertAddLine(lineVo);

		String msg="?????????????????? ??????!", url="/e-approval/confirm/confirmLineDetail?regNo="+lineVo.getRegNo();
		if(result>0) {
			msg="?????????????????? ??????!";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}

	@GetMapping("/confirm/deleteOrder")
	public String deleteOrder(@ModelAttribute ConfirmLineVO confirmlineVo, Model model) {
		logger.info("???????????? confirmlineVo={}", confirmlineVo);

		//DB
		String msg="???????????? ?????? ??????!", url="/e-approval/confirm/confirmLineDetail?regNo="+confirmlineVo.getRegNo();
		int result=confirmlineService.deleteOrder(confirmlineVo);
		if(result>0) {
			msg="???????????? ?????? ??????!";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}


	@GetMapping("/mainpage")
	public String mainpage_get(HttpSession session, Model model) {
		int memNo=(int) session.getAttribute("memNo");
		logger.info("???????????? ??????????????? memNo={}", memNo);

		//DB
		List<Map<String, Object>> confirmingList=confirmService.selectConfirmingView(memNo);
		logger.info("confirmingList.size={}", confirmingList.size());

		int state1=confirmService.countState1(memNo);
		int state2=confirmService.countState2(memNo);
		int state3=confirmService.countState3(memNo);
		int state4=confirmService.countState4(memNo);


		model.addAttribute("confirmingList", confirmingList);
		model.addAttribute("state1",state1);
		model.addAttribute("state2",state2);
		model.addAttribute("state3",state3);
		model.addAttribute("state4",state4);
		return "e-approval/mainpage";
	}



	@GetMapping("/signature/uploadPage")
	public String signaturePage(HttpSession session , Model model) {

		String memId=(String)session.getAttribute("memId");
		logger.info("???????????? ?????????, memId={}", memId);

		EmplVO emplVo=emplService.selectByMemId(memId);
		logger.info("???????????? ??????, emplVo={}", emplVo);

		model.addAttribute("memId", memId);
		model.addAttribute("emplVo", emplVo);

		return "e-approval/signature/uploadPage";
	}

	@PostMapping("/signature/upload")
	public String signatureUpload(
			@ModelAttribute EmplVO emplVo,
			HttpSession session,
			HttpServletRequest request,
			Model model) {
		//???????????? ??????
		String memId=(String)session.getAttribute("memId");
		logger.info("???????????? ???????????? semplVo={}, memId={}", emplVo, memId);

		//???????????????
		String memOriginalfilename="";
		try {
			List<Map<String, Object>> list
				=signatureUploadUtil.fileUpload(request, SignatureConst.UPLOAD_SIGNATURE_FLAG);
			for(Map<String, Object> map : list) {
				memOriginalfilename=map.get("fileName").toString();
				logger.info("???????????? ??????! memOriginalfilename={}", memOriginalfilename);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		emplVo.setMemId(memId);
		emplVo.setMemOriginalfilename(memOriginalfilename);

		//DB
		int result=emplService.updateSignature(emplVo);
		logger.info("???????????? ??? emplVo={}", emplVo);

		String msg="?????? ?????? ??????!", url="/e-approval/signature/uploadPage";
		if(result>0 || memOriginalfilename.length()>1) {
			msg="?????? ?????? ??????!";
			logger.info("???????????? ??????, result={}", result);
		}
		//????????? ????????????
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//??????????????????
		return "common/message";
	}

	@GetMapping("/write/selectForm")
	public String selectForm_get(HttpSession session, Model model) {
		//memNo
		int memNo=(int) session.getAttribute("memNo");
		logger.info("???????????? ???????????? ???????????????, memNo={}", memNo);

		//??????????????????
		List<DocformVO> formList=docformService.selectAll();
		logger.info("???????????? formList.size={}",formList.size());

		List<DoctypeVO> list=doctypeService.selectAll();
		logger.info("???????????? list.size={}",list.size());

		//??????????????????
		List<LineregVO> lineregList=lineregService.SelectAllLinereg(memNo);
		logger.info("?????????????????? lineregList.size={}", lineregList.size());

		model.addAttribute("list", list);
		model.addAttribute("formList", formList);
		model.addAttribute("lineregList", lineregList);

		return "e-approval/write/selectForm";
	}

	@PostMapping("/write/insertConfirm")
	public String insertConfirm(@ModelAttribute ConfirmVO confirmVo,HttpSession session, Model model) {
		int memNo=(int) session.getAttribute("memNo");
		logger.info("???????????? ?????? ??? ???????????? ?????? memNo={}", memNo);

		//DEPT_NO?????????
		Map<String, Object> map=emplService.selectByView(memNo);
		logger.info("DEPT_NO={}",map.get("DEPT_NO"));
		int deptNo=Integer.parseInt(map.get("DEPT_NO").toString());

		confirmVo.setMemNo(memNo);
		confirmVo.setDeptNo(deptNo);
		confirmVo.setCfTitle("????????? ???????????????.");
		confirmVo.setCfState(ConfirmUtil.STATE_TEMP);	//0
		confirmVo.setCfOrder(ConfirmUtil.MY_TURN);	//0

		int result=confirmService.insertPaper(confirmVo);
		logger.info("result={},confirmVo={}",result,confirmVo);

		String msg="???????????? ??????!", url="/e-approval/write/paperWrite";
		if(result>0) {
			msg="???????????? ??????! ?????? ???????????? ???????????????!";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}


	@RequestMapping("/write/paperWrite")
	public String paperWrite_get(HttpSession session, Model model) {
		int memNo=(int) session.getAttribute("memNo");
		logger.info("???????????? ?????????????????????, memNo={}", memNo);

		//??????
		String cfRegdate=ConfirmUtil.getToDay();

		//??????????????????
		ConfirmVO confirmVo=confirmService.selectTempByMemNo(memNo);
		logger.info("confirmVo={}",confirmVo);
		if(confirmVo==null) {
			String msg="???????????? ????????? ????????????. ???????????????????????? ???????????????.";
			String url="/e-approval/write/selectForm";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
		}

		Map<String, Object> map=emplService.selectByView(memNo);

		//????????????
		int cfNo=confirmVo.getCfNo();
		List<Map<String, Object>> orderList =confirmService.selectLineorder(cfNo);

		//????????????
		DocformVO docformVo=docformService.selectByFormNo(confirmVo.getFormNo());

		model.addAttribute("map", map);
		model.addAttribute("confirmVo", confirmVo);
		model.addAttribute("docformVo", docformVo);
		model.addAttribute("cfRegdate", cfRegdate);
		model.addAttribute("orderList", orderList);

		return "e-approval/write/paperWrite";
	}
	@RequestMapping("/write/paperCheck")
	public String paperCheck_get(HttpSession session, Model model) {
		int memNo=(int) session.getAttribute("memNo");
		logger.info("???????????? ?????????????????????, memNo={}", memNo);

		//??????
		String cfRegdate=ConfirmUtil.getToDay();

		//??????????????????
		ConfirmVO confirmVo=confirmService.selectTempByMemNo(memNo);
		logger.info("confirmVo={}",confirmVo);
		if(confirmVo==null) {
			String msg="???????????? ????????? ????????????. ???????????????????????? ???????????????.";
			String url="/e-approval/write/selectForm";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
		}

		Map<String, Object> map=emplService.selectByView(memNo);

		//????????????
		int cfNo=confirmVo.getCfNo();
		List<Map<String, Object>> orderList =confirmService.selectLineorder(cfNo);

		//????????????
		DocformVO docformVo=docformService.selectByFormNo(confirmVo.getFormNo());

		model.addAttribute("map", map);
		model.addAttribute("confirmVo", confirmVo);
		model.addAttribute("docformVo", docformVo);
		model.addAttribute("cfRegdate", cfRegdate);
		model.addAttribute("orderList", orderList);

		return "e-approval/write/paperCheck";
	}

	@PostMapping("/write/updating")
	public String check_post(@ModelAttribute ConfirmVO confirmVo) {
		logger.info("???????????? ???????????? confirmVo={}", confirmVo);

		//??????????????????
		confirmVo.setCfOrder(ConfirmUtil.MY_TURN);
		confirmVo.setCfState(ConfirmUtil.STATE_TEMP);

		//DB
		int result=confirmService.updateContent(confirmVo);
		if(result>0) {
			logger.info("????????????????????????! result={}", result);
		}else {
			logger.info("????????????????????????! result={}", result);
		}

		return "redirect:/e-approval/write/paperCheck";

	}
	@PostMapping("/write/updating2")
	public String complete_post(@ModelAttribute ConfirmVO confirmVo) {
		logger.info("?????????????????? ????????? confirmVo={}", confirmVo);
		int cfNo=confirmVo.getCfNo();

		confirmVo.setCfOrder(ConfirmUtil.SR_TURN);
		confirmVo.setCfState(ConfirmUtil.STATE_REPORT_UP1);


		//DB
		int result=confirmService.updateContent(confirmVo);
		if(result>0) {
			logger.info("??????????????????! result={}", result);
		}else {
			logger.info("??????????????????! result={}", result);
		}

		return "redirect:/e-approval/write/complete?cfNo="+cfNo;

	}

	@GetMapping("/write/complete")
	public void completePage(@RequestParam(defaultValue = "0")int cfNo, Model model) {

		logger.info("???????????? ?????????! cfNo={}",cfNo);

		model.addAttribute("cfNo", cfNo);

	}

	@GetMapping("/approval")
	public String approval(@RequestParam(defaultValue = "0")int cfNo, Model model) {
		logger.info("??????????????? cfNo={}", cfNo);

		//DB
		String msg="???????????? ??????!", url="/e-approval/mainpage";
		int result=confirmService.updateCfOrder(cfNo);
		if(result>0) {
			msg="???????????? ??????!";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@GetMapping("/reject")
	public String reject(@RequestParam(defaultValue = "0")int cfNo, Model model) {
		logger.info("??????????????? cfNo={}", cfNo);

		//DB
		String msg="???????????? ??????!", url="/e-approval/mainpage";
		int result=confirmService.updateReject(cfNo);
		if(result>0) {
			msg="???????????? ??????!";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@GetMapping("/write/detail")
	public String detail(@RequestParam(defaultValue = "0") int cfNo, HttpSession session, Model model) {

		int memNo=(int)session.getAttribute("memNo");
		logger.info("???????????? cfNo={}, memNo={}", cfNo, memNo);

		ConfirmVO confirmVo=confirmService.selectByCfNo(cfNo);
		logger.info("confirmVo={}",confirmVo);

		Map<String, Object> map=emplService.selectByView(memNo);

		//????????????
		List<Map<String, Object>> orderList =confirmService.selectLineorder(cfNo);

		//????????????
		DocformVO docformVo=docformService.selectByFormNo(confirmVo.getFormNo());

		model.addAttribute("map", map);
		model.addAttribute("confirmVo", confirmVo);
		model.addAttribute("docformVo", docformVo);
		model.addAttribute("orderList", orderList);

		return "e-approval/write/detail";
	}



}
