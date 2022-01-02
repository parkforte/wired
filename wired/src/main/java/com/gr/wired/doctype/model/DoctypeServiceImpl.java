package com.gr.wired.doctype.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DoctypeServiceImpl implements DoctypeService{

	private static final Logger logger
		= LoggerFactory.getLogger(DoctypeServiceImpl.class);

	private final DoctypeDAO doctypeDao;

	@Autowired
	public DoctypeServiceImpl(DoctypeDAO doctypeDao) {
		this.doctypeDao = doctypeDao;
		logger.info("DoctypeServiceImpl 생성자주입");
	}


	@Override
	public int insertDoctype(DoctypeVO vo) {
		return doctypeDao.insertDoctype(vo);
	}


	@Override
	public List<DoctypeVO> selectAll() {
		return doctypeDao.selectAll();
	}


	@Override
	public int deleteDoctype(int typeNo) {
		return doctypeDao.deleteDoctype(typeNo);
	}

}
