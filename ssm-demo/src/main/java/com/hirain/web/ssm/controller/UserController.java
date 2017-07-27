package com.hirain.web.ssm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hirain.web.ssm.entity.User;
import com.hirain.web.ssm.service.UserService;

import lombok.extern.apachecommons.CommonsLog;

@Controller
@CommonsLog
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/getUser", method = RequestMethod.GET)
	public @ResponseBody List<User> list() {
		final List<User> users = userService.selectAll();
		log.info("----------list users-------------");
		return users;
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> createUser(User user) {
		final Map<String, String> map = new HashMap<>();
		if (user.getId() == null) {
			userService.createUser(user);
			log.info("createUser");
			map.put("operate", "create");
		} else {
			userService.updateUser(user);
			log.info("updateUser");
			map.put("operate", "update");
		}
		map.put("operateTarget", user.getUsername());
		return map;
	}

	@RequestMapping(value = "/delete", method = { RequestMethod.POST, RequestMethod.GET })
	@Transactional
	public @ResponseBody Map<String, String> deleteUser(Long id, HttpServletRequest request) {
		final Map<String, String> map = new HashMap<>();
		userService.deleteUser(id);
		log.info("deleteUser");
		map.put("result", "success");
		return map;
	}
}
