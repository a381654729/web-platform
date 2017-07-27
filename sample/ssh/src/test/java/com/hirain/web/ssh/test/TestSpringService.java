/**
 * 
 */
package com.hirain.web.ssh.test;

import static org.junit.Assert.assertNotNull;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hirain.web.ssh.service.TestService;

/**
 * @author hao.zheng
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-common.xml", "classpath:spring-web.xml" })
public class TestSpringService {

	@Resource
	private TestService service;

	@Test
	public void testConfig() {
		assertNotNull(service);
	}
}
