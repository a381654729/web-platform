package com.hirain.web.ssm.mapping;

import java.util.List;

import com.hirain.web.ssm.entity.UserScore;

public interface ScoreMapper {

	int deleteByPrimaryKey(UserScore key);

	int insert(UserScore record);

	int insertSelective(UserScore record);

	List<UserScore> selectAll();
}