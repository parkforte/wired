package com.gr.wired.webHard.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gr.wired.common.BSearchVO;

@Mapper
public interface WebHardDAO {
	int insertMyFile(WebHardVO webHardVo);
	int insertFile(WebHardVO webHardVo);
	Map<String, Object> selectByMemNo(int memNo);
	List<WebHardVO> selectFile(BSearchVO searchVo);
	List<WebHardVO> allFile(BSearchVO searchVo);
	int myTotal(BSearchVO searchVo);
	int comTotal(BSearchVO searchVo);
	int updateDownCount(int fileNo);
	int deleteWebHard(int fileNo);

}
