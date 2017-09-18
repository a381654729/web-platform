package com.hirain.ssmongo.dao;

import java.util.List;

import com.hirain.ssmongo.entity.User;

public interface UserDao {

	List<User> findAll();

	List<User> findList(int skip, int limit);

	void store(User user);

	User findOne(String id);

	User findOneByUsername(String username);

	void updateFirst(User user);

	void delete(String... ids);
}
