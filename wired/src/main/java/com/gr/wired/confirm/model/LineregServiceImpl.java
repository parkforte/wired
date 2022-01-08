package com.gr.wired.confirm.model;

import org.springframework.beans.factory.annotation.Autowired;

public class LineregServiceImpl implements LineregService {

	private final LineregDAO lineregDao;

	@Autowired
	public LineregServiceImpl(LineregDAO lineregDao) {
		this.lineregDao = lineregDao;
	}


	@Override
	public int insertLinereg(LineregVO lineregVo) {
		return lineregDao.insertLinereg(lineregVo);
	}

}
