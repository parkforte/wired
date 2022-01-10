package com.gr.wired.addBook.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gr.wired.common.SearchVO;
import com.gr.wired.employee.model.EmplVO;

@Mapper
public interface addressBookDAO {
	int insertAddressBook(addressBookVO addressBookVo);
	String selectPwd(String memId);
	addressBookVO selectByMemId(String memId);
	List<Map<String, Object>> selectAll(SearchVO searchVo);
	int updateSignature(addressBookVO addressBookVo);
	int selectTotalRecord(SearchVO searchVo);
	List<Map<String, Object>> selectByMemName(addressBookVO addressBookVo);
	int updateAdd(addressBookVO addressBookVo);
}


