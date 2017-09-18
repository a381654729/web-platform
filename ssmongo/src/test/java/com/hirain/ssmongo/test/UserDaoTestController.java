package com.hirain.ssmongo.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hirain.ssmongo.dao.UserDao;
import com.hirain.ssmongo.entity.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:servlet-context.xml",
		"classpath:spring-common.xml" })
public class UserDaoTestController {

	@Resource
	private UserDao userDao;

	@Test
	public void save() {
		final User user = new User();
		user.setUsername("admin");
		user.setPassword("123456");
		userDao.store(user);
		System.out.println("插入用户");
		final User user2 = userDao.findOneByUsername("admin");
		Assert.assertNotNull(user2);
	}

	@Test
	public void update() {
		final User user = userDao.findOneByUsername("admin");
		System.out.println("更新账户密码");

		user.setPassword("111111");
		userDao.updateFirst(user);

		final User user2 = userDao.findOneByUsername("admin");
		Assert.assertEquals("111111", user2.getPassword());
	}

	@Test
	public void findAll() {
		final List<User> users = userDao.findList(1, 2);
		for (final User user : users) {
			System.out.println("用户" + user.getUsername());
		}
	}

	@Test
	public void delete() {
		userDao.delete(userDao.findOneByUsername("admin").getId());
	}
}
