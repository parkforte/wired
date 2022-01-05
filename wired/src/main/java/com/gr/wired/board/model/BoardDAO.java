package com.gr.wired.board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {
	int insertBoard(BoardVO boardVo);
	List<Map<String, Object>> selectByBNoList(int boardNo);
	int selectTotalRecord(int boardNo);
	int selectByMemId(String memId);
}
