package com.gr.wired.addBook.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gr.wired.common.SearchVO;

@Mapper
public interface addressBookDAO {
	int insertAddressBook(addressBookVO addressBookVo);
	String selectPwd(String memId);
	addressBookVO selectByMemId(String memId);
	List<Map<String, Object>> selectAll(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
	int updateSignature(addressBookVO addressBookVo);
	List<Map<String, Object>> selectByMemName(addressBookVO addressBookVo);
}
