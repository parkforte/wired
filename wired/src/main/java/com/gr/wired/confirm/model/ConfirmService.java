package com.gr.wired.confirm.model;

import java.util.List;
import java.util.Map;

import com.gr.wired.common.SearchVO;

public interface ConfirmService {
	int insertPaper(ConfirmVO confirmVo);
	ConfirmVO selectTempByMemNo(int memNo);
	int updateContent(ConfirmVO confirmVo);
	List<Map<String, Object>> selectLineorder(int cfNo);
	List<Map<String, Object>> selectConfirmingView(int memNo);
	int updateCfOrder(int cfNo);
	int updateReject(int cfNo);
	int countState1(int memNo);
	int countState2(int memNo);
	int countState3(int memNo);
	int countState4(int memNo);
	List<ConfirmVO> selectAll(ConfirmVO confirmVo);
	int selectTotalRecord(ConfirmVO confirmVo);
	ConfirmVO selectByCfNo(int cfNo);
}
