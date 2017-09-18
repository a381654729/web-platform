package com.hirain.web.ssm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
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

	@Transactional
	@RequestMapping(value = "/changePwd", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> changePassword(String oldpwd, String newpwd) {
		final Map<String, String> map = new HashMap<>();
		try {
			final String username = (String) SecurityUtils.getSubject().getSession()
					.getAttribute("loginName");
			final User user = userService.selectUser(username);
			final boolean isCorrect = user.isCorrectPassword(oldpwd);
			if (isCorrect) {
				user.setPassword(user.encryptPassword(newpwd));
				userService.updateUser(user);
				log.info("update password success");
				map.put("result", "success");
			} else {
				log.info("wrong old password");
				map.put("result", "fail");
				map.put("msg", "原密码不正确");
			}
		} catch (final Exception e) {
			log.info("update password error");
			map.put("result", "fail");
			map.put("msg", "修改密码出错");
		}
		return map;
	}

	@RequestMapping(value = "/loginUser", method = RequestMethod.POST)
	public @ResponseBody User loginUser() {
		final String username = (String) SecurityUtils.getSubject().getSession()
				.getAttribute("loginName");
		return userService.selectUser(username);
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> updateUser(User user) {
		final Map<String, String> map = new HashMap<>();
		try {
			userService.updateUser(user);
			map.put("result", "success");
		} catch (final Exception e) {
			map.put("result", "fail");
			map.put("msg", "更新用户信息出错");
			e.printStackTrace();
		}
		return map;
	}
}
