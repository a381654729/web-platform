package com.hirain.web.ssm.mapping;

import org.springframework.stereotype.Repository;

import com.hirain.web.ssm.entity.Role;

@Repository
public interface RoleMapper {

	int deleteByPrimaryKey(Long id);

	int insert(Role record);

	int insertSelective(Role record);

	Role selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(Role record);

	int updateByPrimaryKey(Role record);
}