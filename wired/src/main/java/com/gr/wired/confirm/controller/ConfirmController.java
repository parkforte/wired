package com.gr.wired.confirm.controller;

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
	public void docbox_get() {
		logger.info("문서함!");
	}




	@RequestMapping("/signature/paint")
	public void signature_get() {
		logger.info("서명만들기 화면!");
	}

	@GetMapping("/confirm/confirmAdmin")
	public void confirmLinePage(HttpSession session,@RequestParam(defaultValue = "0") int regNo , Model model) {
		int memNo =(int)session.getAttribute("memNo");
		logger.info("결재선관리 화면! memNo={}, regNo={}", memNo, regNo);

		//DB
		List<LineregVO> lineregList= lineregService.SelectAllLinereg(memNo);
		//List<Map<String, Object>> confirmlineList= confirmlineService.selectALLRegNo(regNo);

		model.addAttribute("lineregList", lineregList);
		//model.addAttribute("confirmlineList", confirmlineList);


	}

	@PostMapping("/confirm/confirmAdmin")
	public String searchMember(@ModelAttribute EmplVO emplVo, @RequestParam(defaultValue = "0") int regNo, Model model) {
		logger.info("라인등록 사원조회 및 현재 regNo={}, emplVo={}", regNo,emplVo);

		List<Map<String, Object>> emplList=emplService.selectByMemName(emplVo);
		logger.info("사원조회 결과, emplList.size={}", emplList.size());

		model.addAttribute("emplList", emplList);
		logger.info("emplList={}",emplList);

		String url="redirect:confirmAdmin?regNo="+regNo;

		return url;
	}



	@PostMapping("/confirm/addLine")
	public String addLine(@ModelAttribute LineregVO lineregVo, HttpSession session) {
		int memNo =(int)session.getAttribute("memNo");
		logger.info("결재라인명 추가 lineregVo={}, memNo={} ", lineregVo, memNo);

		lineregVo.setMemNo(memNo);
		//DB
		int result=lineregService.insertLinereg(lineregVo);
		if(result>0) {
			logger.info("결재라인명 추가 성공! result={}", result);
		}

		return "redirect:/e-approval/confirm/confirmAdmin";

	}

	@GetMapping("/confirm/deleteLine")
	public String deleteLine(@RequestParam(defaultValue = "0") int regNo, Model model) {
		logger.info("결재라인 삭제, regNo={}", regNo);

		//DB
		int result=lineregService.deleteLinereg(regNo);

		String msg="결재라인 삭제 실패!", url="/e-approval/confirm/confirmAdmin";
		if(result>0) {
			msg="결재라인 삭제 성공!";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}


	@GetMapping("/confirm/confirmLineDetail")
	public String lineDetail(@RequestParam(defaultValue = "0") int regNo, Model model) {
		logger.info("결재라인정보 상세페이지 regNo={}", regNo);

		//DB
		List<Map<String, Object>> confirmlineList=confirmlineService.selectALLRegNo(regNo);

		model.addAttribute("confirmlineList", confirmlineList);
		logger.info("ConfirmLine 조회결과 list.size={}", confirmlineList.size());

		return "e-approval/confirm/confirmLineDetail";

	}


	@PostMapping("/confirm/searchMember")
	public String addOrder(@ModelAttribute EmplVO emplVo, @RequestParam(defaultValue = "0") int regNo, Model model) {
		logger.info("사원조회, emplVo={}, regNo={}", emplVo, regNo);

		List<Map<String, Object>> emplList=emplService.selectByMemName(emplVo);
		logger.info("사원조회 결과, emplList.size={}", emplList.size());

		List<Map<String, Object>> confirmlineList=confirmlineService.selectALLRegNo(regNo);

		model.addAttribute("confirmlineList", confirmlineList);
		logger.info("ConfirmLine 조회결과 list.size={}", confirmlineList.size());


		model.addAttribute("emplList", emplList);
		logger.info("emplList={}",emplList);

		return "e-approval/confirm/confirmLineDetail";
	}

	@PostMapping("/confirm/addLineOrder")
	public String addLineOrder(@ModelAttribute ConfirmLineVO lineVo, Model model) {
		logger.info("결재순서 등록 lineVo={}", lineVo);

		//DB
		int result=confirmlineService.insertAddLine(lineVo);

		String msg="결재라인등록 실패!", url="/e-approval/confirm/confirmLineDetail?regNo="+lineVo.getRegNo();
		if(result>0) {
			msg="결재라인등록 성공!";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}

	@GetMapping("/confirm/deleteOrder")
	public String deleteOrder(@ModelAttribute ConfirmLineVO confirmlineVo, Model model) {
		logger.info("라인삭제 confirmlineVo={}", confirmlineVo);

		//DB
		String msg="결재라인 삭제 실패!", url="/e-approval/confirm/confirmLineDetail?regNo="+confirmlineVo.getRegNo();
		int result=confirmlineService.deleteOrder(confirmlineVo);
		if(result>0) {
			msg="결재라인 삭제 성공!";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}


	@GetMapping("/mainpage")
	public String mainpage_get() {
		logger.info("전자결재 메인페이지");
		return "e-approval/mainpage";
	}



	@GetMapping("/signature/uploadPage")
	public String signaturePage(HttpSession session , Model model) {

		String memId=(String)session.getAttribute("memId");
		logger.info("서명관리 페이지, memId={}", memId);

		EmplVO emplVo=emplService.selectByMemId(memId);
		logger.info("사원정보 조회, emplVo={}", emplVo);

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
		//파라미터 읽기
		String memId=(String)session.getAttribute("memId");
		logger.info("서명등록 파라미터 semplVo={}, memId={}", emplVo, memId);

		//파일업로드
		String memOriginalfilename="";
		try {
			List<Map<String, Object>> list
				=signatureUploadUtil.fileUpload(request, SignatureConst.UPLOAD_SIGNATURE_FLAG);
			for(Map<String, Object> map : list) {
				memOriginalfilename=map.get("fileName").toString();
				logger.info("서명변경 성공! memOriginalfilename={}", memOriginalfilename);
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
		logger.info("업데이트 후 emplVo={}", emplVo);

		String msg="서명 등록 실패!", url="/e-approval/signature/uploadPage";
		if(result>0 || memOriginalfilename.length()>1) {
			msg="서명 등록 성공!";
			logger.info("서명등록 결과, result={}", result);
		}
		//모델에 결과저장
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//뷰페이지리턴
		return "common/message";
	}

	@GetMapping("/write/selectForm")
	public String selectForm_get(HttpSession session, Model model) {
		//memNo
		int memNo=(int) session.getAttribute("memNo");
		logger.info("전자결재 문서양식 선택페이지, memNo={}", memNo);

		//양식선택목록
		List<DocformVO> formList=docformService.selectAll();
		logger.info("문서양식 formList.size={}",formList.size());

		List<DoctypeVO> list=doctypeService.selectAll();
		logger.info("문서종류 list.size={}",list.size());

		//결재라인선택
		List<LineregVO> lineregList=lineregService.SelectAllLinereg(memNo);
		logger.info("결재라인종류 lineregList.size={}", lineregList.size());

		model.addAttribute("list", list);
		model.addAttribute("formList", formList);
		model.addAttribute("lineregList", lineregList);

		return "e-approval/write/selectForm";
	}

	@PostMapping("/write/insertConfirm")
	public String insertConfirm(@ModelAttribute ConfirmVO confirmVo,HttpSession session, Model model) {
		int memNo=(int) session.getAttribute("memNo");
		logger.info("문서생성 완료 및 문서화면 이동 memNo={}", memNo);

		//DEPT_NO구하기
		Map<String, Object> map=emplService.selectByView(memNo);
		logger.info("DEPT_NO={}",map.get("DEPT_NO"));
		int deptNo=Integer.parseInt(map.get("DEPT_NO").toString());

		confirmVo.setMemNo(memNo);
		confirmVo.setDeptNo(deptNo);
		confirmVo.setCfTitle("제목을 입력하세요.");
		confirmVo.setCfState(ConfirmUtil.STATE_TEMP);	//0
		confirmVo.setCfOrder(ConfirmUtil.MY_TURN);	//0

		int result=confirmService.insertPaper(confirmVo);
		logger.info("result={},confirmVo={}",result,confirmVo);

		String msg="문서생성 실패!", url="/e-approval/write/paperWrite";
		if(result>0) {
			msg="문서생성 성공! 작성 페이지로 이동합니다!";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}


	@RequestMapping("/write/paperWrite")
	public String paperWrite_get(HttpSession session, Model model) {
		int memNo=(int) session.getAttribute("memNo");
		logger.info("전자결재 문서작성페이지, memNo={}", memNo);

		//날짜
		String cfRegdate=ConfirmUtil.getToDay();

		//문서상세내용
		ConfirmVO confirmVo=confirmService.selectTempByMemNo(memNo);
		if(confirmVo==null) {
			String msg="생성하신 문서가 없습니다. 문서선택화면으로 이동합니다.";
			String url="/e-approval/write/selectForm";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
		}

		Map<String, Object> map=emplService.selectByView(memNo);
		logger.info("confirmVo={}",confirmVo);

		//결재라인
		int cfNo=confirmVo.getCfNo();
		List<Map<String, Object>> orderList =confirmService.selectLineorder(cfNo);

		model.addAttribute("map", map);
		model.addAttribute("confirmVo", confirmVo);
		model.addAttribute("cfRegdate", cfRegdate);
		model.addAttribute("orderList", orderList);

		return "e-approval/write/paperWrite";
	}

	@PostMapping("/write/updating")
	public String complete_post(@ModelAttribute ConfirmVO confirmVo) {
		logger.info("문서상신완료 페이지 confirmVo={}", confirmVo);

		//DB
		int result=confirmService.updateContent(confirmVo);
		if(result>0) {
			logger.info("문서상신성공! result={}", result);
		}else {
			logger.info("문서상신실패! result={}", result);
		}

		return "redirect:/e-approval/write/complete";

	}

	@RequestMapping("/write/complete")
	public void completePage() {
		logger.info("상신완료 페이지!");
	}




}
