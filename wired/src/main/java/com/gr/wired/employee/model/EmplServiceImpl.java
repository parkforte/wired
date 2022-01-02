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

	@Override
	public int loginCheck(String memId, String memPwd) {
		String dbPwd = emplDao.selectPwd(memId);
		int result=0;
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=USERID_NONE;
		}else {
			if(dbPwd.equals(memPwd)) {
				result=LOGIN_OK;
			}else {
				result=DISAGREE_PWD;
			}
		}

		return result;
	}

	@Override
	public EmplVO selectByMemId(String memId) {
		return emplDao.selectByMemId(memId);
	}




}
