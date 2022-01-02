package com.gr.wired.bdList.model;

import java.util.List;
import java.util.Map;

public interface BdListService {

	List<Map<String, Object>> selectBdList();
	int selectTotalRecord();
}
