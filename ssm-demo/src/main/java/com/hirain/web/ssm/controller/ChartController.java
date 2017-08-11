package com.hirain.web.ssm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hirain.web.ssm.entity.RealtimeData;
import com.hirain.web.ssm.entity.Result;
import com.hirain.web.ssm.entity.UserScore;
import com.hirain.web.ssm.service.ScoreService;

import lombok.extern.apachecommons.CommonsLog;

@Controller
@CommonsLog
@RequestMapping(value = "/chart")
public class ChartController {

	@Autowired
	private ScoreService scoreService;

	private final SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");

	@RequestMapping(value = "/score", method = RequestMethod.POST)
	public @ResponseBody List<UserScore> getScore() {
		log.info("getScore");
		return scoreService.selectAll();
	};

	@RequestMapping(value = "/pie", method = RequestMethod.POST)
	public @ResponseBody List<Result> getResult() {
		log.info("getResult");
		final List<UserScore> scores = getScore();
		final List<Result> results = new ArrayList<>();
		for (final UserScore score : scores) {
			final Result result = new Result();
			result.setName(score.getUsername());
			result.setValue(score.getScore());
			results.add(result);
		}
		return results;

	}

	// @RequestMapping(value = "/realtime", method = RequestMethod.POST)
	// public @ResponseBody List<RealtimeData> getData() {
	// final List<RealtimeData> datas = new ArrayList<>();
	// for (int i = 0; i < 5; i++) {
	// final RealtimeData data = new RealtimeData();
	// final Date date = new Date();
	// final String now = sdf.format(date);
	// data.setTime(now);
	// final double value = Math.random() * 100;
	// data.setValue(value);
	// log.info("time:" + now + ",value:" + value);
	// datas.add(data);
	// }
	// return datas;
	// }

	@RequestMapping(value = "/realtime", method = RequestMethod.POST)
	public @ResponseBody List<RealtimeData> getData(RealtimeData lastData) {
		if (lastData.getTime() == null || lastData.getTime() == "") {
			final String date = insertData();
			return scoreService.selectByDate(date, sdf.format(new Date()));
		} else {
			insertDataToDB(lastData.getValue());
			final Date date = new Date();
			final String now = sdf.format(date);
			return scoreService.selectByDate(lastData.getTime(), now);
		}
	}

	private String insertData() {
		return insertDataToDB(Math.random() * 1000);
	}

	private String insertDataToDB(double lastValue) {
		double value = lastValue;
		String firstDate = null;
		for (int i = 0; i < 5; i++) {
			final RealtimeData data = new RealtimeData();
			final Date date = new Date();
			final String now = sdf.format(date);
			data.setTime(now);
			value = value + Math.random() * 21;
			data.setValue(value);
			log.info("time:" + now + " data:value");
			scoreService.insertRealtimeData(data);
			if (i == 0) {
				firstDate = now;
			}
		}
		return firstDate;
	}

}
