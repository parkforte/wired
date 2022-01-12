package com.gr.wired.addBook.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gr.wired.common.SearchVO;

@Mapper
public interface addressBookDAO {
	int insertAddressBook(addressBookVO addressBookVo);
	int loginCheck(String memId, String memPwd);
	addressBookVO selectByAddNo(int addbookNo);
	List<Map<String, Object>> selectAll(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
	int updateSignature(addressBookVO addressBookVo);
	List<Map<String, Object>> selectByMemName(addressBookVO addressBookVo);
	int updateAddressBook(addressBookVO addressBookVo);
	addressBookVO selectByMemId(String memId);
	int deleteAddressBook(int addbookNo);
}


