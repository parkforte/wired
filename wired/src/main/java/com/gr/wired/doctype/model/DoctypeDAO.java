package com.gr.wired.doctype.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DoctypeDAO {
	int insertDoctype(DoctypeVO vo);
	List<DoctypeVO> selectAll();
	int deleteDoctype(int typeNo);
}
