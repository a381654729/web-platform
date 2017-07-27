package com.hirain.web.ssm.mapping;

import org.springframework.stereotype.Repository;

import com.hirain.web.ssm.entity.Permission;

@Repository
public interface PermissionMapper {

	int deleteByPrimaryKey(Long id);

	int insert(Permission record);

	int insertSelective(Permission record);

	Permission selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(Permission record);

	int updateByPrimaryKey(Permission record);
}