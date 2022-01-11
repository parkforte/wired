package com.gr.wired.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.gr.wired.common.SearchVO;

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
	public List<Map<String, Object>> selectByBNoList(SearchVO searchVo) {
		return boardDao.selectByBNoList(searchVo);
	}

	@Override
	public int selectTotalRecord(int boardNo) {
		return boardDao.selectTotalRecord(boardNo);
	}

	@Override
	public int selectByMemId(String memId) {
		return boardDao.selectByMemId(memId);
	}

	@Override
	public Map<String, Object> selectByNo(int boardNo) {
		return boardDao.selectByNo(boardNo);
	}

	@Override
	public int updateBoard(BoardVO boardVo) {
		return boardDao.updateBoard(boardVo);
	}

	@Override
	public int updateReadCount(int boardNo) {
		return boardDao.updateReadCount(boardNo);
	}

	@Override
	public int updateRecommend(int boardNo) {
		return boardDao.updateRecommend(boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return boardDao.deleteBoard(boardNo);
	}

	@Override
	@Transactional
	public int deleteMulti(List<BoardVO> list) {
		int cnt=0;
		try {
			for(BoardVO vo : list) {
				int boardNo=vo.getBoardNo();
				if(boardNo!=0) {
					cnt=boardDao.deleteBoard(boardNo);
				}
			}

		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1; //실패
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		//선언적 트랜잭션에서는 런타임 예외가 발생하면 롤백 한다.
		//반면에 예외가 전혀 발생하지 않거나 체크 예외가 발생하면 커밋한다.
		return cnt;
	}










}

