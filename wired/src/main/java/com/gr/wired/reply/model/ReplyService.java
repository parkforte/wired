package com.gr.wired.reply.model;

import java.util.List;
import java.util.Map;

public interface ReplyService {
	int insertBdList(ReplyVO replyVo);
	int selectById(String memId);
	List<Map<String, Object>> selectAll(int boardNo);
	int updateSortNo(ReplyVO replyVo);
	int reply(ReplyVO replyVo);
}
