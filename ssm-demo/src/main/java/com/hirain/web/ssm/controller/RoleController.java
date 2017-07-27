package com.hirain.web.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hirain.web.ssm.entity.Role;
import com.hirain.web.ssm.service.RoleService;

import lombok.extern.apachecommons.CommonsLog;

@Controller
@RequestMapping(value = "/role")
@CommonsLog
public class RoleController {

	@Autowired
	private RoleService roleService;

	@RequestMapping(value = "/getRole", method = RequestMethod.GET)
	public @ResponseBody List<Role> list() {
		final List<Role> roles = roleService.selectAll();
		log.info("----------list roles----------");
		return roles;
	}
}
