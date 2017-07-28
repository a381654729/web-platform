package com.hirain.web.ssm.service;

import com.hirain.web.ssm.entity.User;

public interface UserService {

	public User findByName(String username);
}
