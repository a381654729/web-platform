package com.hirain.web.ssm.service;

import java.util.List;

import com.hirain.web.ssm.entity.User;

public interface UserService {

	public List<User> selectAll();

	public void createUser(User user);

	public void updateUser(User user);

	public void deleteUser(Long user);

	public User selectUser(String username);

	public User selectUserWithRoles(String username);

}
