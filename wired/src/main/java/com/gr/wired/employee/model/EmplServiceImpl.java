package com.gr.wired.employee.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmplServiceImpl implements EmplService{
	private final EmplDAO emplDao;

	@Autowired
	public EmplServiceImpl(EmplDAO emplDao) {
		this.emplDao = emplDao;
	}

	@Override
	public int insertEmployee(EmplVO emplVo) {
		return emplDao.insertEmployee(emplVo);
	}




}
