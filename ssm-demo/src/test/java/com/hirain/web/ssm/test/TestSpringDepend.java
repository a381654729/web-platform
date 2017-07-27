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
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 * @author hao.zheng
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextHierarchy(value = { @ContextConfiguration("classpath:spring-service.xml"),
		@ContextConfiguration(classes = { AppConfig.class }) })
@WebAppConfiguration(value = "src/main/webapp")
public class TestSpringDepend {

	private @Resource Pojo pojo;

	@Test
	public void testPojo() {
		// 测试�?要在配置文件中增�? <context:component-scanbase-package="com.hirain.web.test"/>
		assertNotNull(pojo);
		assertEquals(1, pojo.get());
	}
}
