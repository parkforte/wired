package com.gr.wired.confirm.model;

import java.util.List;

public interface LineregService {
	int insertLinereg(LineregVO lineregVo);
	List<LineregVO> SelectAllLinereg(int memNo);
	int deleteLinereg(int regNo);

}
