package com.gr.wired.addBook.model;

import java.util.List;
import java.util.Map;

import com.gr.wired.common.SearchVO;

public interface addressBookService {
	//로그인 처리시 필요한 상수
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int DISAGREE_PWD=2; //비번 불일치
	int USERID_NONE=3; //아이디 존재하지 않음

	int insertAddressBook(addressBookVO addressBookVo);
	int loginCheck(String memId, String memPwd);
	addressBookVO selectByMemId(String memId);
	List<Map<String, Object>> selectAll(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
	int updateSignature(addressBookVO addressBookVo);
	List<Map<String, Object>> selectByMemName(addressBookVO addressBookVo);


}
