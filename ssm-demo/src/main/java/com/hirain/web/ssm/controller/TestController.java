package com.hirain.web.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hirain.web.ssm.service.TestService;

@Controller
public class TestController {

	@Autowired
	private TestService testService;

	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test() {
		return testService.test();
	}
}
