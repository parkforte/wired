package com.gr.wired.docform.model;

import java.util.List;

public interface DocformService {

	List<DocformVO> selectAll();
	int insertDocform(DocformVO vo);
	int deleteDocform(int formNo);
	DocformVO selectByFormNo(int formNo);

}
