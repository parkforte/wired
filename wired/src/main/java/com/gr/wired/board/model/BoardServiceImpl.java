package com.gr.wired.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
	private final BoardDAO boardDao;

	@Autowired
	public BoardServiceImpl(BoardDAO boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public int insertBoard(BoardVO boardVo) {
		return boardDao.insertBoard(boardVo);
	}

	@Override
	public List<Map<String, Object>> selectByBNoList(int boardNo) {
		return boardDao.selectByBNoList(boardNo);
	}

	@Override
	public int selectTotalRecord(int boardNo) {
		return boardDao.selectTotalRecord(boardNo);
	}

	@Override
	public int selectByMemId(String memId) {
		return boardDao.selectByMemId(memId);
	}








}
