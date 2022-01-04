package com.gr.wired.bdList.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gr.wired.common.SearchVO;

@Mapper
public interface BdListDAO {
	List<Map<String, Object>> selectBdList(SearchVO searchVo);
	int selectTotalRecord();
	List<Map<String, Object>> selectRanks();
	List<BdListVO> selectBdListE();
	int insertBdList(BdListVO bdListVo);
	int updatebdList(BdListVO bsListVo);
}
