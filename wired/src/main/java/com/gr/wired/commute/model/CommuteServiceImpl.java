package com.gr.wired.commute.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gr.wired.common.BSearchVO;
import com.gr.wired.common.DateSearchVO;
import com.gr.wired.common.SearchVO;

@Service
public class CommuteServiceImpl implements CommuteService{
	private final CommuteDAO commuteDao;

	@Autowired
	public CommuteServiceImpl(CommuteDAO commuteDao) {
		this.commuteDao = commuteDao;
	}

	@Override
	public int comCheck(int memNo) {
		return commuteDao.comCheck(memNo);
	}

	@Override
	public int insertCommute(CommuteVO commuteVo) {
		return commuteDao.insertCommute(commuteVo);
	}

	@Override
	public int selectByCNo(int memNo) {
		return commuteDao.selectByCNo(memNo);
	}

	@Override
	public int updateCommute(int comNo) {
		return commuteDao.updateCommute(comNo);
	}

	@Override
	public int selectDeNo(int memNo) {
		return commuteDao.selectDeNo(memNo);
	}

	@Override
	public List<Map<String, Object>> selectAll(DateSearchVO dateSearchVo) {
		return commuteDao.selectAll(dateSearchVo);
	}

	@Override
	public int selectTotalRecord(DateSearchVO dateSearchVo) {
		return commuteDao.selectTotalRecord(dateSearchVo);
	}

	@Override
	public Map<String, Object> selectHoliday(int memNo) {
		return commuteDao.selectHoliday(memNo);
	}











}
