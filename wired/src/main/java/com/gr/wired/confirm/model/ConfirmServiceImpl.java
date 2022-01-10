package com.gr.wired.confirm.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConfirmServiceImpl implements ConfirmService {

	private final ConfirmDAO confirmDao;


	@Autowired
	public ConfirmServiceImpl(ConfirmDAO confirmDao) {
		super();
		this.confirmDao = confirmDao;
	}

	@Override
	public int insertPaper(ConfirmVO confirmVo) {
		return confirmDao.insertPaper(confirmVo);
	}

	@Override
	public ConfirmVO selectTempByMemNo(int memNo) {
		return confirmDao.selectTempByMemNo(memNo);
	}
}
