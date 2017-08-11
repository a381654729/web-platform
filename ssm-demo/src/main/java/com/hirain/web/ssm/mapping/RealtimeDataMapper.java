package com.hirain.web.ssm.mapping;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hirain.web.ssm.entity.RealtimeData;

public interface RealtimeDataMapper {

	int deleteByPrimaryKey(String time);

	int insert(RealtimeData record);

	int insertSelective(RealtimeData record);

	RealtimeData selectByPrimaryKey(String time);

	int updateByPrimaryKeySelective(RealtimeData record);

	int updateByPrimaryKey(RealtimeData record);

	List<RealtimeData> selectByDate(@Param("date1") String date1, @Param("date2") String date2);

}