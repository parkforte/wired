package com.gr.wired.employee.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gr.wired.common.BSearchVO;
import com.gr.wired.common.SearchVO;

@Service
public class EmplServiceImpl implements EmplService{
	private final EmplDAO emplDao;

	@Autowired
	public EmplServiceImpl(EmplDAO emplDao) {
		this.emplDao = emplDao;
	}

	@Override
	public int insertMember(EmplVO emplVo) {
		return emplDao.insertMember(emplVo);
	}

	@Override
	public int loginCheck(String memId, String memPwd) {
		String dbPwd = emplDao.selectPwd(memId);
		String dbResign = emplDao.selectResign(memId);
		int result=0;
		if(dbResign!=null) {
			result=USERID_NONE;
		}else if(dbPwd==null || dbPwd.isEmpty()) {
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

	@Override
	public List<Map<String, Object>> selectAll(BSearchVO searchVo) {
		return emplDao.selectAll(searchVo);
	}

	@Override
	public int selectTotalRecord(BSearchVO searchVo) {
		return emplDao.selectTotalRecord(searchVo);
	}

	@Override
	public int updateSignature(EmplVO emplVo) {
		return emplDao.updateSignature(emplVo);
	}

	@Override
	public List<Map<String, Object>> selectByMemName(EmplVO emplVo) {
		return emplDao.selectByMemName(emplVo);
	}

	@Override
	public Map<String, Object> selectByView(int memNo) {
		return emplDao.selectByView(memNo);
	}

	@Override
	public int updateMember(EmplVO emplVo) {
		return emplDao.updateMember(emplVo);
	}

	@Override
	public int upResignMember(int memNo) {
		return emplDao.upResignMember(memNo);
	}

	@Override
	public List<Map<String, Object>> resignMember() {
		return emplDao.resignMember();
	}

	@Override
	public int upBackMember(int memNo) {
		return emplDao.upBackMember(memNo);
	}











}
