package com.gr.wired.addBook.model;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gr.wired.common.SearchVO;

@Service
public class addressBookServiceImpl implements addressBookService{
	private final addressBookDAO addressBookDao;

	@Autowired
	public addressBookServiceImpl(addressBookDAO addressBookDao) {
		this.addressBookDao = addressBookDao;
	}

	@Override
	public int insertAddressBook(addressBookVO addressBookVo) {
		return addressBookDao.insertAddressBook(addressBookVo);
	}


	@Override
	public addressBookVO selectByMemId(String memId) {
		return addressBookDao.selectByMemId(memId);
	}

	@Override
	public List<Map<String, Object>> selectAll(SearchVO searchVo) {
		return addressBookDao.selectAll(searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return addressBookDao.selectTotalRecord(searchVo);
	}

	@Override
	public List<Map<String, Object>> selectByMemName(addressBookVO addressBookVo) {
		return addressBookDao.selectByMemName(addressBookVo);
	}

	@Override
	public int updateSignature(addressBookVO addressBookVo) {
		return addressBookDao.updateSignature(addressBookVo);
	}

	@Override
	public int updateAddressBook(addressBookVO addressBookVo) {
		return addressBookDao.updateAddressBook(addressBookVo);
	}

	@Override
	public int deleteAddressBook(int addrbookNo) {
		return addressBookDao.deleteAddressBook(addrbookNo);
	}

	@Override
	public addressBookVO selectByAddNo(int addrbookNo) {
		return addressBookDao.selectByAddNo(addrbookNo);
	}





}
