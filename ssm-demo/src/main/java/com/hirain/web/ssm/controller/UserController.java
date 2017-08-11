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
import com.hirain.web.ssm.service.RoleService;
import com.hirain.web.ssm.service.UserService;

import lombok.extern.apachecommons.CommonsLog;

@Controller
@CommonsLog
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@RequestMapping(value = "/getUser", method = RequestMethod.GET)
	public @ResponseBody List<User> list() {
		final List<User> users = userService.selectAll();
		log.info("----------list users-------------");
		return users;
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> createUser(User user, String role) {
		final Map<String, String> map = new HashMap<>();
		final String password = user.getPassword();
		if (user.getId() == null) {
			if (password != null || password != "") {
				log.info(password);
				user.setPassword(user.encryptPassword(password));
			}
			userService.createUser(user);
			log.info("createUser");
			map.put("operate", "create");
		} else {
			if (!password.equals(null) && !password.equals("")) {
				log.info(password);
				user.setPassword(user.encryptPassword(password));
			} else {
				final User selectUser = userService.selectByPrimaryKey(user.getId());
				user.setPassword(selectUser.getPassword());
			}
			userService.updateUser(user);
			log.info("updateUser");
			map.put("operate", "update");
		}
		final User currentUser = userService.selectUser(user.getUsername());
		userService.deleteRole(currentUser.getId());
		if (role != null || role != "") {
			roleService.updateUserAndRole(role, currentUser.getId());
		}
		map.put("operateTarget", user.getUsername());
		return map;
	}

	@RequestMapping(value = "/delete", method = { RequestMethod.POST, RequestMethod.GET })
	@Transactional
	public @ResponseBody Map<String, String> deleteUser(Long id, HttpServletRequest request) {
		final Map<String, String> map = new HashMap<>();
		userService.deleteUser(id);
		userService.deleteRole(id);
		log.info("deleteUser");
		map.put("result", "success");
		return map;
	}
}
