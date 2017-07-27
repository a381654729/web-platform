package com.hirain.web.ssm.mapping;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hirain.web.ssm.entity.User;

@Repository
public interface UserMapper {

	int deleteByPrimaryKey(Long id);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(Long id);

	User selectByUsername(String username);

	User selectWithRoles(String username);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);

	List<User> selectAll();
}