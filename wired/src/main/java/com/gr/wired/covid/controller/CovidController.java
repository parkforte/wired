package com.gr.wired.covid.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CovidController {
	Logger logger = LoggerFactory.getLogger(CovidController.class);

	@RequestMapping("/covidTest/covid")
	public void covid() {
		logger.info("covid 화면 보여주기");
	}

	@RequestMapping(value="/covidTest/getCovidApi")
	public void getCovidApi(HttpServletRequest req, ModelMap model,
			HttpServletResponse response) throws Exception{
		logger.info("covid 1");
		//요청변호 설정
		String currentPage = req.getParameter("currentPage");    //요청 변수 설정 (현재 페이지. currentPage : n > 0)
		String countPerPage = req.getParameter("countPerPage");  //요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100)
		String confmKey = req.getParameter("confmKey");          //요청 변수 설정 (승인키)
		String keyword = req.getParameter("keyword");            //요청 변수 설정 (키워드)
		String spclAdmTyCd = req.getParameter("spclAdmTyCd");
		logger.info("currentPage={}, countPerPage={}, resultType={}, confmKey={}, keyword={}",
				currentPage, countPerPage,confmKey, keyword);
		// OPEN API 호출 URL 정보 설정
		String apiUrl = "http://apis.data.go.kr/B551182/pubReliefHospService/getpubReliefHospList?ServiceKey="+confmKey+"&pageNo="+currentPage+"&numOfRows="+countPerPage+"&spclAdmTyCd="+spclAdmTyCd;
		URL url = new URL(apiUrl);
    	BufferedReader br
    	= new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
    	StringBuffer sb = new StringBuffer();
    	String tempStr = null;
    	while(true){
    		tempStr = br.readLine();
    		if(tempStr == null) break;
    		sb.append(tempStr);								// 응답결과 XML 저장
    	}
    	br.close();
    	response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml");
		response.getWriter().write(sb.toString());			// 응답결과 반환
		logger.info(sb.toString());
	}

}
