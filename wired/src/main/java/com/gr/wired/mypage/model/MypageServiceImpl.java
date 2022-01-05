package com.gr.wired.mypage.model;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gr.wired.employee.model.EmplVO;

@Service
public class MypageServiceImpl implements MypageService{
	private final MypageDAO mypageDao;

	@Autowired
	public MypageServiceImpl(MypageDAO mypageDao) {
		this.mypageDao = mypageDao;
	}

	@Override
	public Map<String, Object> selectByMemId(String memId) {
		return mypageDao.selectByMemId(memId);
	}

	@Override
	public int updateMember(EmplVO emplVo) {
		return mypageDao.updateMember(emplVo);
	}











}
