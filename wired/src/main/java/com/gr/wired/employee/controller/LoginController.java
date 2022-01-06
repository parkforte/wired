package com.gr.wired.employee.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.gr.wired.employee.model.EmplService;
import com.gr.wired.employee.model.EmplVO;

@Controller
public class LoginController {
	private static final Logger logger
		=LoggerFactory.getLogger(LoginController.class);

	private final EmplService emplService;

	@Autowired
	public LoginController(EmplService emplService) {
		this.emplService = emplService;
	}

	@GetMapping("/login")
	public void login_get() {
		logger.info("로그인 화면");
	}

	@PostMapping("/login")
	public String login_post(@ModelAttribute EmplVO vo, @RequestParam(required = false) String chkSave,
			HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		logger.info("로그인 처리, 파라미터 vo={}, chkSave={}", vo, chkSave);

		String msg="로그인 처리 실패", url="/login";
		int result=emplService.loginCheck(vo.getMemId(), vo.getMemPwd());
		if(result==emplService.LOGIN_OK) {
			EmplVO emplVo=emplService.selectByMemId(vo.getMemId());

			//[1] 세션에 아이디 저장
			HttpSession session=request.getSession();
			session.setAttribute("memId", vo.getMemId());
			session.setAttribute("memName", emplVo.getMemName());
			session.setAttribute("ranksNo", emplVo.getRanksNo());

			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();

			//[2] 쿠키에 저장 - 아이디 저장하기, 체크된 경우만
			Cookie ck = new Cookie("ck_memId", vo.getMemId());
			ck.setPath("/");
			if(chkSave != null) {
				ck.setMaxAge(1000*24*60*60);
				response.addCookie(ck);
			}else {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}

			if(Character.compare(emplVo.getMemFlag(), 'Y')==0) {
				msg=emplVo.getMemName() + "님 로그인되었습니다.";
				url="/index";
			}else {
				msg=emplVo.getMemName() + "님 로그인되었습니다.";
				url="/mypage/mypage";
			}

		}else if(result==emplService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==emplService.USERID_NONE) {
			msg="해당 아이디가 존재하지 않습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("로그아웃 처리");

		session.removeAttribute("memId");
		session.removeAttribute("memName");

		return "redirect:/index";
	}
}
