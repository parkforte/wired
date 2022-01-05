package com.gr.wired.board.model;

import java.util.List;
import java.util.Map;

public interface BoardService {
	int insertBoard(BoardVO boardVo);
	List<Map<String, Object>> selectByBNoList(int boardNo);
	int selectTotalRecord(int boardNo);
	int selectByMemId(String memId);
}
