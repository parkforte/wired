package com.gr.wired.mypage.model;

import java.util.Map;

import com.gr.wired.employee.model.EmplVO;

public interface MypageService {
	Map<String, Object> selectByMemId(String memId);
	int updateMember(EmplVO emplVo);
}
