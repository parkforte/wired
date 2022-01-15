package com.gr.wired.board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gr.wired.common.BSearchVO;
import com.gr.wired.common.SearchVO;

@Mapper
public interface BoardDAO {
	int insertBoard(BoardVO boardVo);
	List<Map<String, Object>> selectByBNoList(BSearchVO searchVo);
	int selectTotalRecord(BSearchVO searchVo);
	List<Map<String, Object>> selectMainNotice();
	int selectByMemId(String memId);
	BoardVO selectByNo (int boardNo);
	int updateBoard(BoardVO boardVo);
	int updateReadCount(int boardNo);
	int updateRecommend(int boardNo);
	int deleteBoard(int boardNo);
	int updateDownCount(int boardNo);
}

