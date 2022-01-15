package com.gr.wired.docform.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DocformServiceImpl implements DocformService {


	private final DocformDAO docformDao;

	@Autowired
	public DocformServiceImpl(DocformDAO docformDao) {
		this.docformDao = docformDao;
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


	@Override
	public DocformVO selectByFormNo(int formNo) {
		return docformDao.selectByFormNo(formNo);
	}


}
