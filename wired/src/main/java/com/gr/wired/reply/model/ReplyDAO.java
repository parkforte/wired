package com.gr.wired.reply.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyDAO {
	int insertReply(ReplyVO replyVo);
	int selectById(String memId);
	List<Map<String, Object>> selectAll(int boardNo);
}
