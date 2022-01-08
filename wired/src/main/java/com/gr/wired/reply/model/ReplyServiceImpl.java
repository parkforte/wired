package com.gr.wired.reply.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService{
	private final ReplyDAO replyDao;

	@Autowired
	public ReplyServiceImpl(ReplyDAO replyDao) {
		super();
		this.replyDao = replyDao;
	}

	@Override
	public int insertBdList(ReplyVO replyVo) {
		return replyDao.insertBdList(replyVo);
	}

	@Override
	public int selectById(String memId) {
		return replyDao.selectById(memId);
	}

	@Override
	public List<Map<String, Object>> selectAll(int boardNo) {
		return replyDao.selectAll(boardNo);
	}

	@Override
	public int updateSortNo(ReplyVO replyVo) {
		return replyDao.updateSortNo(replyVo);
	}

	@Override
	public int reply(ReplyVO replyVo) {
		return replyDao.reply(replyVo);
	}


}
