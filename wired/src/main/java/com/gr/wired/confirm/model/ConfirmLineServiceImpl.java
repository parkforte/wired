package com.gr.wired.confirm.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConfirmLineServiceImpl implements ConfirmLineService {

	private final ConfirmLineDAO confirmlineDao;

	@Autowired
	public ConfirmLineServiceImpl(ConfirmLineDAO confirmlineDao) {
		super();
		this.confirmlineDao = confirmlineDao;
	}

	@Override
	public int insertConfirmLine(LineregVO lineregVo) {
		return confirmlineDao.insertConfirmLine(lineregVo);
	}

	@Override
	public List<Map<String, Object>> selectALLRegNo(int regNo) {
		return confirmlineDao.selectALLRegNo(regNo);
	}

	@Override
	public int insertAddLine(ConfirmLineVO lineVo) {
		return confirmlineDao.insertAddLine(lineVo);
	}

	@Override
	public int deleteOrder(ConfirmLineVO confirmlineVo) {
		return confirmlineDao.deleteOrder(confirmlineVo);
	}


}
