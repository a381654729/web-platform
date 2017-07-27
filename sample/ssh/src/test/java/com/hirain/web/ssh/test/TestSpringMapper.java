/**
 * 
 */
package com.hirain.web.ssh.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hirain.web.ssh.entity.Person;
import com.hirain.web.ssh.repository.PersonRepository;

/**
 * @author hao.zheng
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-common.xml", "classpath:spring-web.xml" })
public class TestSpringMapper {
	@Autowired
	private PersonRepository dao;
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
		final List<Person> selectAll = dao.findAll();
		final int size2 = selectAll.size();
		return size2;
	}

	@Test
	public void testMapper() {
		assertNotNull(dao);
	}

	@Test
	public void testInsert() {
		final Person record = new Person();
		record.setUsername("username");
		final Long save = dao.save(record);
		assertEquals(size + 1, getSize());

		dao.delete(save);

		assertEquals(size, getSize());
	}

}
