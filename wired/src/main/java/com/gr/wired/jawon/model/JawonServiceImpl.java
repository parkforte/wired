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
	public int insertJawonList(ResTypeVO resTypeVo) {
		return jawonDao.insertJawonList(resTypeVo);
	}

	@Override
	public List<ResTypeVO> selectType() {
		return jawonDao.selectType();
	}

	@Override
	public List<Map<String, Object>> selectJawonDetailsView(int typeNo) {
		return jawonDao.selectJawonDetailsView(typeNo);
	}

	@Override
	public List<JawonAllVO> selectJawonAll() {
		return jawonDao.selectJawonAll();
	}

	@Override
	public List<Map<String, Object>> selectByType(int typeNo) {
		return jawonDao.selectByType(typeNo);
	}

	@Override
	public int insertJawonReserve(ResScheduleVO resScheduleVo) {
		return jawonDao.insertJawonReserve(resScheduleVo);
	}

	@Override
	public List<Map<String, Object>> selectJawonMyView(int memNo) {
		return jawonDao.selectJawonMyView(memNo);
	}

	@Override
	public int deleteReserve(int reservNo) {
		return jawonDao.deleteReserve(reservNo);
	}

	@Override
	public List<Map<String, Object>> selectJawonAllView() {
		return jawonDao.selectJawonAllView();
	}

	@Override
	public int deleteJawonType(int typeNo) {
		return jawonDao.deleteJawonType(typeNo);
	}



}
