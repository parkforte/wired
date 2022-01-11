package com.gr.wired.bdList.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gr.wired.common.SearchVO;

@Service
public class BdListServiceImpl implements BdListService{
	private final BdListDAO bdListDao;

	@Autowired
	public BdListServiceImpl(BdListDAO bdListDao) {
		this.bdListDao = bdListDao;
	}


	@Override
	public List<Map<String, Object>> selectBdList(SearchVO searchVo) {
		return bdListDao.selectBdList(searchVo);
	}

	@Override
	public int selectTotalRecord() {
		return bdListDao.selectTotalRecord();
	}

	@Override
	public List<Map<String, Object>> selectRanks() {
		return bdListDao.selectRanks();
	}

	@Override
	public int insertBdList(BdListVO bdListVo) {
		return bdListDao.insertBdList(bdListVo);
	}


	@Override
	public List<BdListVO> selectBdListE() {
		return bdListDao.selectBdListE();
	}


	@Override
	public int updatebdList(BdListVO bsListVo) {
		return bdListDao.updatebdList(bsListVo);
	}


	@Override
	public List<BdListVO> selectMenu() {
		return bdListDao.selectMenu();
	}












}
