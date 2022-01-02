package com.gr.wired.doctype.model;

import java.util.List;

public interface DoctypeService {
	int insertDoctype(DoctypeVO vo);
	List<DoctypeVO> selectAll();
	int deleteDoctype(int typeNo);

}
