package com.gr.wired.docform.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DocformDAO {
	List<DocformVO> selectAll();
	int insertDocform(DocformVO vo);
}
