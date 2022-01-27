package com.gr.wired.covid19.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Covid19Controller{

	private final static Logger logger
	=LoggerFactory.getLogger(Covid19Controller.class);

	@RequestMapping("/inc/covid19")
	public void xmlSample() {
		logger.info("코로나19 시도별 현황 - 화면 보여주기");
	}

	@RequestMapping("/sample/covid19")
	public void getAddrApi(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("컨트롤러 start");
		//요청변수 설정
		String serviceKey = request.getParameter("serviceKey");	//Service Key
		String pageNo = request.getParameter("pageNo");	//페이지번호
		String numOfRows = request.getParameter("numOfRows");	//한 페이지 결과 수
		String startCreateDt = request.getParameter("startCreateDt");	//검색할 생성일 범위의 시작
		String endCreateDt = request.getParameter("endCreateDt");	//검색할 생성일 범위의 종료
		//OPEN API 호출 URL 정보 설정
		String apiUrl = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?serviceKey="+serviceKey+"&pageNo="+pageNo+"&numOfRows="+numOfRows+"&startCreateDt="+startCreateDt+"&endCreateDt="+endCreateDt;
//		String apiUrl = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?serviceKey=OfEsOtklGh4oLrpA3fUlfsQgL59MCNhIwILKKSsJT5zJeCFmSaEiYZrO85uoZYaJO4HvxSEQ9Jagb5OraOJgCQ%3D%3D&pageNo=1&numOfRows=10&startCreateDt=20210101&endCreateDt=20210101";
		logger.info("apiUrl={}",apiUrl);
		URL url = new URL(apiUrl);
		BufferedReader br
		= new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
		StringBuffer sb = new StringBuffer();
		String tempStr = null;

		while(true) {
			tempStr = br.readLine();
			if(tempStr == null) break;
			sb.append(tempStr);	//응답결과 JSON 저장
		}
		br.close();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json");
		response.getWriter().write(sb.toString());	//응답결과 반환
		logger.info(sb.toString());
	}
}