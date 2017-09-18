package com.hirain.web.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hirain.web.ssm.entity.User;
import com.hirain.web.ssm.mapping.UserMapper;
import com.hirain.web.ssm.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public List<User> selectAll() {
		return userMapper.selectAll();
	}

	@Override
	public void createUser(User user) {
		userMapper.insert(user);
	}

	@Override
	public void updateUser(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public void deleteUser(Long id) {
		userMapper.deleteByPrimaryKey(id);
	}

	@Override
	public User selectUser(String username) {
		return userMapper.selectByUsername(username);
	}

	@Override
	public User selectUserWithRoles(String username) {
		return userMapper.selectWithRoles(username);
	}

	@Override
	public void deleteRole(Long userId) {
		userMapper.deleteRoleById(userId);
	}

	@Override
	public User selectByPrimaryKey(Long id) {
		return userMapper.selectByPrimaryKey(id);
	}

}
