package com.hirain.web.ssm.test;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = { "com.hirain.web.ssm.service", "com.hirain.web.ssm.mapping",
		"com.hirain.web.ssm.entity" })
public class personConfig {
}