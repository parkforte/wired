package com.gr.wired.confirm.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/e-approval")
public class ServiceAreaFoodController {
	private static final Logger logger
		=LoggerFactory.getLogger(ServiceAreaFoodController.class);

	@RequestMapping("/serviceAreaFood")
	public void zipcode() {
		logger.info("휴게소별 대표음식");
	}

	@RequestMapping("/ajaxServiceAreaFood")
	public void ajaxServiceAreaFood(HttpServletRequest request, Model model,
			HttpServletResponse response) throws Exception {
		// 요청 변수 설정
		String pageNo = request.getParameter("pageNo");
		String numOfRows = request.getParameter("numOfRows");
		String type = request.getParameter("type");
		String confmKey = request.getParameter("confmKey");
		String serviceAreaName = request.getParameter("serviceAreaName");

		logger.info("pageNo={}, numOfRows={}, type={}, confmKey={}, serviceAreaName={}",
				pageNo, numOfRows, type, confmKey, serviceAreaName);

		// 요청 변수 설정 (키워드)
		// OPEN API 호출 URL 정보 설정
		String apiUrl= "http://data.ex.co.kr/openapi/business/representFoodServiceArea?key="+confmKey+"&type=json&numOfRows="+numOfRows+"&pageNo="+pageNo+"&serviceAreaName="+URLEncoder.encode(serviceAreaName,"UTF-8");
		URL url = new URL(apiUrl);
		BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
		StringBuffer sb = new StringBuffer();
		String tempStr = null;

		while(true) {
			tempStr = br.readLine();
			if(tempStr==null) break;
			sb.append(tempStr);	//응답결과 JSON 저장
		}
		br.close();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json");
		response.getWriter().write(sb.toString());	//응답결과 반환

	}
}
