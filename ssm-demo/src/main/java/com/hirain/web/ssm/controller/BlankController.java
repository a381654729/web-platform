package com.hirain.web.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.apachecommons.CommonsLog;

@Controller
@CommonsLog
public class BlankController {

	@RequestMapping(value = "/user")
	public String user() {
		log.info("load user.jsp");
		return "user";
	}
}
