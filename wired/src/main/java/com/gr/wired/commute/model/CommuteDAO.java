package com.gr.wired.commute.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommuteDAO {
	int comCheck(int memNo);
	int insertCommute(CommuteVO commuteVo);
	int selectByCNo(int memNo);
	int updateCommute(int comNo);
	int selectDeNo(int memNo);
	List<Map<String, Object>> selectAll(CommuteVO commuteVo);

}
