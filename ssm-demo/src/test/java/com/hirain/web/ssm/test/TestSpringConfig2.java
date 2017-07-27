package com.hirain.web.ssm.test;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.hirain.web.ssm.service.TestService;

public class TestSpringConfig2 {

	@Test
	public void testPerson() {
		final ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring-service.xml");

		context.start();

		final TestService service = context.getBean(TestService.class);
		assertNotNull(service);

		context.close();
	}
}