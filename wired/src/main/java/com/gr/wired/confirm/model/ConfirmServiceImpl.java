package com.gr.wired.confirm.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ConfirmServiceImpl implements ConfirmService {

	private static final Logger logger
		= LoggerFactory.getLogger(ConfirmServiceImpl.class);

	private final ConfirmDAO confirmDao;


	@Autowired
	public ConfirmServiceImpl(ConfirmDAO confirmDao) {
		super();
		this.confirmDao = confirmDao;
	}

	@Override
	@Transactional
	public int insertPaper(ConfirmVO confirmVo) {
		//임시저장 기능을 살려보자.
		int cnt=confirmDao.countTemp(confirmVo.getMemNo());
		int result=0;
		if(cnt>0) {
			int temp=confirmDao.deleteTemp(confirmVo.getMemNo());
			logger.info("임시저장 삭제 temp={}", temp);
			result=confirmDao.insertPaper(confirmVo);
			logger.info("삭제 후 INSERT result={}", result);
		}else {
			result=confirmDao.insertPaper(confirmVo);
			logger.info("INSERT result={}", result);
		}
		return result;
	}

	@Override
	public ConfirmVO selectTempByMemNo(int memNo) {
		return confirmDao.selectTempByMemNo(memNo);
	}

	@Override
	public int updateContent(ConfirmVO confirmVo) {
		return confirmDao.updateContent(confirmVo);
	}

	@Override
	public List<Map<String, Object>> selectLineorder(int cfNo) {
		return confirmDao.selectLineorder(cfNo);
	}

	@Override
	public List<Map<String, Object>> selectConfirmingView(int memNo) {
		return confirmDao.selectConfirmingView(memNo);
	}

	@Override
	public int updateCfOrder(int cfNo) {
		return confirmDao.updateCfOrder(cfNo);
	}

	@Override
	public int updateReject(int cfNo) {
		return confirmDao.updateReject(cfNo);
	}
}
