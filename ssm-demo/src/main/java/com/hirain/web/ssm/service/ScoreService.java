package com.hirain.web.ssm.service;

import java.util.List;

import com.hirain.web.ssm.entity.RealtimeData;
import com.hirain.web.ssm.entity.UserScore;

public interface ScoreService {

	public List<UserScore> selectAll();

	public void insertRealtimeData(RealtimeData data);

	public List<RealtimeData> selectByDate(String date1, String date2);

	public List<RealtimeData> selectAllData();
}
