package com.hirain.web.ssm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hirain.web.ssm.entity.User;
import com.hirain.web.ssm.mapping.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userDao;

	@Override
	public User findByName(String username) {
		// final User user = userDao.selectByName(username);
		final User user = userDao.selectWithRoles(username);
		return user;
	}

}
