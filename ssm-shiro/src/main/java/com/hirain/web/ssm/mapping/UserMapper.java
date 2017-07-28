package com.hirain.web.ssm.mapping;

import org.springframework.stereotype.Repository;

import com.hirain.web.ssm.entity.User;

@Repository
public interface UserMapper {

	int deleteByPrimaryKey(Long id);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);

	User selectByName(String username);

	User selectWithRoles(String username);

}