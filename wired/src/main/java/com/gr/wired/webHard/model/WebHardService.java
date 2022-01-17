package com.gr.wired.webHard.model;

import java.util.List;
import java.util.Map;

import com.gr.wired.common.BSearchVO;

public interface WebHardService {
	int insertMyFile(WebHardVO webHardVo);
	int insertFile(WebHardVO webHardVo);
	Map<String, Object> selectByMemNo(int memNo);
	List<WebHardVO> selectFile(BSearchVO searchVo);
	List<WebHardVO> allFile(BSearchVO searchVo);
	int myTotal(BSearchVO searchVo);
	int comTotal(BSearchVO searchVo);
	int updateDownCount(int fileNo);
	int deleteWebHard(int fileNo);
	int deleteMulti(List<WebHardVO> list);

}
