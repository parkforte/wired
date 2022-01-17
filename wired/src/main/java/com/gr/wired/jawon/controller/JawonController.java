package com.gr.wired.jawon.controller;

import java.util.List;
import java.util.Map;

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

import com.gr.wired.jawon.model.JawonAllVO;
import com.gr.wired.jawon.model.JawonService;
import com.gr.wired.jawon.model.JawonVO;
import com.gr.wired.jawon.model.ResScheduleVO;
import com.gr.wired.jawon.model.ResTypeVO;

@Controller
@RequestMapping("/jawon")
public class JawonController {
	private static final Logger logger
		=LoggerFactory.getLogger(JawonController.class);

	private final JawonService jawonService;

	@Autowired
	public JawonController(JawonService jawonService) {
		this.jawonService = jawonService;
	}

	@RequestMapping("/listAdd")
	public String listAdd(@ModelAttribute ResTypeVO vo, Model model) {
		logger.info("자원종류 등록 처리, 파라미터 vo={}", vo);

		int cnt = jawonService.insertJawonList(vo);
		logger.info("자원종류 등록 결과, cnt={}", cnt);

		String msg="자원종류 등록 실패", url="/jawon/jawonManage";
		if(cnt>0) {
			msg="자원종류 등록 성공";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/listdelete")
	public String listDel(@RequestParam(defaultValue = "0") int typeNo, Model model) {
		logger.info("자원종류 삭제 처리, 파라미터 typeNo={}", typeNo);

		int cnt=jawonService.deleteJawonType(typeNo);
		logger.info("자원종류 삭제 결과, cnt={}",cnt);

		String msg="자원종류 삭제 실패 ", url="/jawon/jawonManage";
		if(cnt>0) {
			msg="자원종류 삭제 성공";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/jawonManage")
	public String jawonListAll(Model model) {
		logger.info("자원전체목록");

		List<JawonAllVO> list=jawonService.selectJawonAll();
		logger.info("종류리스트 조회 결과, list.size={}", list.size());

		for(JawonAllVO jawonAllVo : list) {
			int typeNo=jawonAllVo.getResTypeVo().getTypeNo();

			List<Map<String, Object>> detailList=jawonService.selectJawonDetailsView(typeNo);
			jawonAllVo.setTypeDetailsList(detailList);
		}

		model.addAttribute("tList", list);

		return "jawon/jawonManage";
	}

	@GetMapping("/jawonReserve")
	public String jawonRes_get(@RequestParam(defaultValue = "0") int typeNo, Model model) {
		logger.info("자원예약 화면, 파라미터 typeNo={}",typeNo);

		List<ResTypeVO> typeList = jawonService.selectType();
		logger.info("예약 화면 처리1, typeList.size={}", typeList.size());

		List<Map<String, Object>> list=jawonService.selectByType(typeNo);
		logger.info("예약 화면 처리2, list.size={}", list.size());

		model.addAttribute("typeList", typeList);
		model.addAttribute("rList", list);

		return "jawon/jawonReserve";
	}

	@PostMapping("/jawonReserve")
	public String jawonRes_post(@ModelAttribute ResScheduleVO vo, Model model) {
		logger.info("자원예약 등록 처리, 파라미터 vo={}",vo);

		int cnt=jawonService.insertJawonReserve(vo);
		logger.info("자원예약 등록 결과, cnt={}", cnt);

		String msg="예약 등록 실패", url="/jawon/jawonReserve";
		if(cnt>0) {
			msg="예약 등록 성공";
			url="/jawon/jawonMyList";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/jawonMyList")
	public String jawonMyReserve(HttpSession session, Model model) {
		int memNo=(int) session.getAttribute("memNo");
		logger.info("내 자원 예약 현황, 파라미터 memNo={}", memNo);

		List<Map<String, Object>> list=jawonService.selectJawonMyView(memNo);
		logger.info("내 자원예약 조회 결과, list.size={}", list.size());

		model.addAttribute("mList", list);

		return "jawon/jawonMyList";
	}

	@RequestMapping("/reserveCancel")
	public String reserveCancel(@RequestParam(defaultValue = "0") int reservNo,
			Model model) {
		logger.info("예약 취소 처리, 파라미터 reservNo={}", reservNo);

		int cnt=jawonService.deleteReserve(reservNo);
		if(cnt>0) {
			logger.info("예약 취소 완료");
		}

		model.addAttribute("msg", "예약이 취소 되었습니다.");
		model.addAttribute("url", "/jawon/jawonMyList");

		return "common/message";
	}

	@RequestMapping("/jawonAllList")
	public String reserveAll(Model model) {
		logger.info("전체 예약 현황");

		List<Map<String, Object>> list=jawonService.selectJawonAllView();
		logger.info("전체예약현황 조회 결과, list.size={}", list.size());

		model.addAttribute("aList", list);

		return "jawon/jawonAllList";
	}

	@RequestMapping("/jawonAdd")
	public String jawonAdd(@ModelAttribute JawonVO vo, Model model) {
		logger.info("자원 추가 처리, 파라미터 vo={}", vo);

		int cnt=jawonService.insertJawon(vo);
		logger.info("자원 추가 결과, cnt={}", cnt);

		String msg="자원 추가 실패", url="/jawon/jawonManage";
		if(cnt>0) {
			msg="자원 추가 성공";
			url="/jawon/jawonManage";
		}

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}

	@RequestMapping("/jawonEdit")
	public String jawonEdit(@ModelAttribute JawonVO vo, Model model) {
		logger.info("자원 수정 처리, 파라미터 vo={}", vo);

		int cnt=jawonService.updateJawon(vo);
		logger.info("자원 수정 결과, cnt={}", cnt);

		String msg="자원 수정 실패", url="/jawon/jawonManage";
		if(cnt>0) {
			msg="자원 수정 성공";
			url="/jawon/jawonManage";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/jawonMapBak")
	public void jawonMap() {
		logger.info("위치 등록 화면");
	}


	@RequestMapping("/reserveLocation")
	public String jawonLoc(@RequestParam(defaultValue = "0") int resNo, Model model) {
		logger.info("자원 예약 위치, 파라미터 resNo={}", resNo);

		JawonVO jawonVo=jawonService.selectJawonLoc(resNo);
		logger.info("자원 예약 위치 결과, jawonVo={}", jawonVo);

		model.addAttribute("jawonVo", jawonVo);

		return "jawon/jawonMapView";
	}

}
