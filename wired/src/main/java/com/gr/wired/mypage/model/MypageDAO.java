package com.gr.wired.mypage.model;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gr.wired.employee.model.EmplVO;

@Mapper
public interface MypageDAO {
	Map<String, Object> selectByMemId(int memNo);
	int updateMember(EmplVO emplVo);
}
