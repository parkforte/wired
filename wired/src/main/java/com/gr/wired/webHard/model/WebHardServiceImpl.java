package com.gr.wired.webHard.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.gr.wired.common.BSearchVO;

@Service
public class WebHardServiceImpl implements WebHardService{
	private final WebHardDAO webHardDao;

	@Autowired
	public WebHardServiceImpl(WebHardDAO webHardDao) {
		this.webHardDao = webHardDao;
	}


	@Override
	public int insertMyFile(WebHardVO webHardVo) {
		return webHardDao.insertMyFile(webHardVo);
	}

	@Override
	public int insertFile(WebHardVO webHardVo) {
		return webHardDao.insertFile(webHardVo);
	}

	@Override
	public Map<String, Object> selectByMemNo(int memNo) {
		return webHardDao.selectByMemNo(memNo);
	}

	@Override
	public List<WebHardVO> selectFile(BSearchVO searchVo) {
		return webHardDao.selectFile(searchVo);
	}

	@Override
	public List<WebHardVO> allFile(BSearchVO searchVo) {
		return webHardDao.allFile(searchVo);
	}

	@Override
	public int updateDownCount(int fileNo) {
		return webHardDao.updateDownCount(fileNo);
	}

	@Override
	public int deleteWebHard(int fileNo) {
		return deleteWebHard(fileNo);
	}

	@Override
	public int deleteMulti(List<WebHardVO> list) {
		int cnt=0;
		try {
			for(WebHardVO vo : list) {
				int fileNo=vo.getFileNo();
				if(fileNo!=0) {
					cnt=webHardDao.deleteWebHard(fileNo);
				}
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		//선언적 트랜잭션에서는 런타임 예외가 발생하면 롤백 한다.
		//반면에 예외가 전혀 발생하지 않거나 체크 예외가 발생하면 커밋한다.
		return cnt;
	}


	@Override
	public int myTotal(BSearchVO searchVo) {
		return webHardDao.myTotal(searchVo);
	}


	@Override
	public int comTotal(BSearchVO searchVo) {
		return webHardDao.comTotal(searchVo);
	}








}
