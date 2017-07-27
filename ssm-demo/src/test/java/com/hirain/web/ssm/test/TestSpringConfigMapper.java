/**
 * 
 */
package com.hirain.web.ssm.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hirain.web.ssm.entity.User;
import com.hirain.web.ssm.mapping.UserMapper;

/**
 * @author hao.zheng
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-jdbc.xml" })
public class TestSpringConfigMapper {
	@Autowired
	private UserMapper userMapper;
	private int size;

	@Before
	public void testBefore() {
		final int size2 = getSize();
		size = size2;
	}

	/**
	 * @return
	 */
	private int getSize() {
		final List<User> selectAll = userMapper.selectAll();
		final int size2 = selectAll.size();
		return size2;
	}

	@Test
	public void testMapper() {
		assertNotNull(userMapper);
	}

	@Test
	public void testInsert() {
		final User record = new User();
		record.setId(5);
		userMapper.insert(record);
		assertEquals(size + 1, getSize());

		userMapper.deleteByPrimaryKey(5);

		assertEquals(size, getSize());
	}

}
