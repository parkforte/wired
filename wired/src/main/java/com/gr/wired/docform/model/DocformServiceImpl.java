package com.gr.wired.docform.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DocformServiceImpl implements DocformService {

	private static final Logger logger
		= LoggerFactory.getLogger(DocformServiceImpl.class);

	private final DocformDAO docformDao;

	@Autowired
	public DocformServiceImpl(DocformDAO docformDao) {
		this.docformDao = docformDao;
		logger.info("DocformServiceImpl 생성자주입!");
	}


	@Override
	public List<DocformVO> selectAll() {
		return docformDao.selectAll();
	}

	@Override
	public int insertDocform(DocformVO vo) {
		return docformDao.insertDocform(vo);
	}


	@Override
	public int deleteDocform(int formNo) {
		return docformDao.deleteDocform(formNo);
	}


}
