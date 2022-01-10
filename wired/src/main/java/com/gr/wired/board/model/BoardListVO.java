package com.gr.wired.board.model;

import java.util.List;

public class BoardListVO {
	private List<BoardVO> boardItems;

	public List<BoardVO> getBoardItems() {
		return boardItems;
	}

	public void setBoardItems(List<BoardVO> boardItems) {
		this.boardItems = boardItems;
	}

	@Override
	public String toString() {
		return "BoardListVO [boardItems=" + boardItems + "]";
	}


}
