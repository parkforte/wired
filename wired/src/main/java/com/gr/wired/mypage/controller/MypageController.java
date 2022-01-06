package com.gr.wired.mypage.controller;

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

import com.gr.wired.employee.model.EmplVO;
import com.gr.wired.mypage.model.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	private static final Logger logger
		= LoggerFactory.getLogger(MypageController.class);

	private final MypageService mypageService;

	@Autowired
	public MypageController(MypageService mypageService) {
		this.mypageService = mypageService;
	}

	@GetMapping("/mypage")
	public String mypage_get(HttpSession session, Model model) {
		String memId=(String) session.getAttribute("memId");
		logger.info("사원정보 수정 화면, 파라미터 memId={}", memId);

		Map<String, Object> map=mypageService.selectByMemId(memId);
		logger.info("사원수정 - 조회 결과 map={}", map);

		model.addAttribute("map", map);

		return "mypage/mypage";

	}

	@PostMapping("/mypage")
	public String mypage_post(@ModelAttribute EmplVO vo, HttpSession session,
			Model model) {
		String memId=(String) session.getAttribute("memId");
		vo.setMemId(memId);
		logger.info("사원수정 처리, 파라미터 vo={}", vo);

		if(vo.getMemHp2()==null || vo.getMemHp2().isEmpty() ||
				vo.getMemHp3()==null || vo.getMemHp3().isEmpty()) {
			vo.setMemHp1("");
			vo.setMemHp2("");
			vo.setMemHp3("");
		}

		int cnt=mypageService.updateMember(vo);
		logger.info("사원수정 결과, cnt={}", cnt);

		String msg="사원정보 수정 실패", url="/mypage/mypage";
		if(cnt>0) {
			msg="사원정보수정 완료되었습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}


}
