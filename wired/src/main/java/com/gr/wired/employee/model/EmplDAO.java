package com.gr.wired.employee.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gr.wired.common.BSearchVO;
import com.gr.wired.common.SearchVO;

@Mapper
public interface EmplDAO {
	int insertMember(EmplVO emplVo);
	String selectPwd(String memId);
	String selectResign(String memId);
	EmplVO selectByMemId(String memId);
	List<Map<String, Object>> selectAll(BSearchVO searchVo);
	int selectTotalRecord(BSearchVO searchVo);
	int updateSignature(EmplVO emplVo);
	List<Map<String, Object>> selectByMemName(EmplVO emplVo);
	Map<String, Object> selectByView(int memNo);
	int updateMember(EmplVO emplVo);
	int upResignMember(int memNo);
	List<Map<String, Object>> resignMember(BSearchVO searchVo);
	int upBackMember(int memNo);
	int selectResignRecord(BSearchVO searchVo);
}
