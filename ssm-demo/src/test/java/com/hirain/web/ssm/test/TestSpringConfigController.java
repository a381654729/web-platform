/**
 * 
 */
package com.hirain.web.ssm.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hirain.web.ssm.controller.TestController;

/**
 * @author hao.zheng
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-control.xml" })
public class TestSpringConfigController {

	@Resource
	private TestController service;

	@Test
	public void testConfig() {
		assertNotNull(service);
		assertEquals("test", service.test());
	}
}
