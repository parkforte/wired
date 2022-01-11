package com.gr.wired.confirm.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LineregServiceImpl implements LineregService {

	private static final Logger logger
		= LoggerFactory.getLogger(LineregServiceImpl.class);

	private final LineregDAO lineregDao;
	private final ConfirmLineDAO confirmlineDao;

	@Autowired
	public LineregServiceImpl(LineregDAO lineregDao, ConfirmLineDAO confirmlineDao) {
		this.lineregDao = lineregDao;
		this.confirmlineDao = confirmlineDao;
	}


	@Override
	@Transactional
	public int insertLinereg(LineregVO lineregVo) {
		int cnt=lineregDao.insertLinereg(lineregVo);
		logger.info("결재라인생성중 cnt={}, lineregVo={}", cnt, lineregVo);
		cnt=confirmlineDao.insertAddLine(lineregVo);
		logger.info("LINE_NO, REG_NO INSERT 트랜젝션중, cnt={}, lineregVo={}", cnt, lineregVo);
		return cnt;
	}



	@Override
	public List<LineregVO> SelectAllLinereg(int memNo) {
		return lineregDao.SelectAllLinereg(memNo);
	}

	@Override
	public int deleteLinereg(int regNo) {
		return lineregDao.deleteLinereg(regNo);
	}

}
