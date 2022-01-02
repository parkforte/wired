package com.gr.wired.bdList.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gr.wired.common.PaginationInfo;

@Mapper
public interface BdListDAO {
	List<Map<String, Object>> selectBdList();
	int selectTotalRecord();
}
