package com.gr.wired.approval.controller;

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

import com.gr.wired.docform.model.DocformService;
import com.gr.wired.docform.model.DocformVO;
import com.gr.wired.doctype.model.DoctypeService;
import com.gr.wired.doctype.model.DoctypeVO;
import com.gr.wired.employee.model.EmplService;
import com.gr.wired.employee.model.EmplVO;
import com.gr.wired.util.ApprovalUtil;
import com.gr.wired.util.Signature.SignatureConst;
import com.gr.wired.util.Signature.SignatureUploadUtil;

@Controller
@RequestMapping("/e-approval")
public class ApprovalController {

	private static final Logger logger
		= LoggerFactory.getLogger(ApprovalController.class);

	private final DocformService docformService;
	private final DoctypeService doctypeService;
	private final EmplService emplService;
	private final SignatureUploadUtil signatureUploadUtil;

	@Autowired
	public ApprovalController(DocformService docformService, DoctypeService doctypeService, EmplService emplService,
			SignatureUploadUtil signatureUploadUtil) {
		super();
		this.docformService = docformService;
		this.doctypeService = doctypeService;
		this.emplService = emplService;
		this.signatureUploadUtil = signatureUploadUtil;
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
				memOriginalfilename=(String) map.get("fileName");
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
		if(result>0) {
			msg="서명 등록 성공!";
			logger.info("서명등록 결과, result={}", result);
		}
		//모델에 결과저장
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//뷰페이지리턴
		return "common/message";
	}

	@GetMapping("/write/paperWrite")
	public String approvalTree_get(HttpSession session, Model model) {
		//memId로 문서작성자 뿌리기
		String memId=(String) session.getAttribute("memId");
		logger.info("전자결재 문서작성페이지, memId={}", memId);
		//날짜
		String cfRegdate=ApprovalUtil.getToDay();
		//양식선택목록
		List<DocformVO> formList=docformService.selectAll();
		logger.info("문서양식 formList.size={}",formList.size());

		List<DoctypeVO> list=doctypeService.selectAll();
		logger.info("문서종류 list.size={}",list.size());

		model.addAttribute("list", list);
		model.addAttribute("formList", formList);
		model.addAttribute("cfRegdate", cfRegdate);

		return "e-approval/write/paperWrite";
	}

}
