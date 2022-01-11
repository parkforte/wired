package com.gr.wired.bdList.model;

import java.util.List;
import java.util.Map;

import com.gr.wired.common.SearchVO;

public interface BdListService {
	List<Map<String, Object>> selectBdList(SearchVO searchVo);
	int selectTotalRecord();
	List<Map<String, Object>> selectRanks();
	List<BdListVO> selectBdListE();
	int insertBdList(BdListVO bdListVo);
	int updatebdList(BdListVO bsListVo);
	List<BdListVO> selectMenu();
	BdListVO selectByBdNo(int bdlistNo);
	int deleteBoardList(int bdlistNo);
}
