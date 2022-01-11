package com.gr.wired.jawon.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JawonServiceImpl implements JawonService{
	private final JawonDAO jawonDao;

	@Autowired
	public JawonServiceImpl(JawonDAO jawonDao) {
		this.jawonDao = jawonDao;
	}

	@Override
	public int insertJawonList(JawonVO jawonVo) {
		return jawonDao.insertJawonList(jawonVo);
	}

	@Override
	public List<Map<String, Object>> selectJawonAll() {
		return jawonDao.selectJawonAll();
	}

	@Override
	public List<JawonVO> selectJawonName() {
		return jawonDao.selectJawonName();
	}



}
