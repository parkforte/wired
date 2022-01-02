package com.gr.wired.bdList.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BdListServiceImpl implements BdListService{
	private final BdListDAO bdListDao;

	@Autowired
	public BdListServiceImpl(BdListDAO bdListDao) {
		this.bdListDao = bdListDao;
	}

	@Override
	public List<Map<String, Object>> selectBdList() {
		return bdListDao.selectBdList();
	}

	@Override
	public int selectTotalRecord() {
		return bdListDao.selectTotalRecord();
	}



}
