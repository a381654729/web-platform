package com.hirain.web.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hirain.web.ssm.entity.RealtimeData;
import com.hirain.web.ssm.entity.UserScore;
import com.hirain.web.ssm.mapping.RealtimeDataMapper;
import com.hirain.web.ssm.mapping.ScoreMapper;
import com.hirain.web.ssm.service.ScoreService;

@Service
public class ScoreServiceImpl implements ScoreService {

	@Autowired
	private ScoreMapper scoreDao;

	@Autowired
	private RealtimeDataMapper dataDao;

	@Override
	public List<UserScore> selectAll() {
		return scoreDao.selectAll();
	}

	@Override
	public void insertRealtimeData(RealtimeData data) {
		dataDao.insert(data);
	}

	@Override
	public List<RealtimeData> selectByDate(String date1, String date2) {
		final List<RealtimeData> datas = dataDao.selectByDate(date1, date2);
		return datas;
	}

	@Override
	public List<RealtimeData> selectAllData() {
		return null;
	}

}
