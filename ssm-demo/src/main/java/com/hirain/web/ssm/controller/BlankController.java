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

	@RequestMapping(value = "/permission")
	public String permission() {
		log.info("load permission.jsp");
		return "permission";
	}

	@RequestMapping(value = "/blank")
	public String blank() {
		return "blank";
	}

	@RequestMapping(value = "/chart")
	public String chart() {
		log.info("load chart.jsp");
		return "chart";
	}

	@RequestMapping(value = "/ontime")
	public String ontime() {
		log.info("load ontime.jsp");
		return "ontime";
	}

	@RequestMapping(value = "/tree")
	public String tree() {
		log.info("load tree.jsp");
		return "tree";
	}

	@RequestMapping(value = "/dchart")
	public String dchart() {
		log.info("load dchart.jsp");
		return "dchart";
	}

	@RequestMapping(value = "/map")
	public String map() {
		return "map";
	}
}
