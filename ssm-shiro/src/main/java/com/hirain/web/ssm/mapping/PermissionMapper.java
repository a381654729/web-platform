package com.hirain.web.ssm.mapping;

import java.util.List;

import com.hirain.web.ssm.entity.Permission;

public interface PermissionMapper {

	int deleteByPrimaryKey(Long id);

	int insert(Permission record);

	int insertSelective(Permission record);

	Permission selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(Permission record);

	int updateByPrimaryKey(Permission record);

	List<String> selectByRole(Long id);
}