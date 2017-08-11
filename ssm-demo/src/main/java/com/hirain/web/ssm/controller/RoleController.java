package com.hirain.web.ssm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hirain.web.ssm.entity.Permission;
import com.hirain.web.ssm.entity.Role;
import com.hirain.web.ssm.service.PermissionService;
import com.hirain.web.ssm.service.RoleService;

import lombok.extern.apachecommons.CommonsLog;

@Controller
@RequestMapping(value = "/role")
@CommonsLog
public class RoleController {

	@Autowired
	private RoleService roleService;

	@Autowired
	private PermissionService permissionService;

	@RequestMapping(value = "/getRole", method = RequestMethod.GET)
	public @ResponseBody List<Role> list() {
		final List<Role> roles = roleService.selectAll();
		log.info("----------list roles----------");
		return roles;
	}

	@RequestMapping(value = "/getPermission", method = RequestMethod.GET)
	public @ResponseBody List<Permission> getPermissionList() {
		log.info("-----------list permissions------------");
		return permissionService.selectAll();
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@Transactional
	public @ResponseBody Map<String, String> addRole(Role role, String permissionId) {
		final Map<String, String> map = new HashMap<>();
		try {
			roleService.insert(role);
			final Role currentRole = roleService.selectByName(role.getCname());
			permissionService.deletePermissionByRole(currentRole.getId());
			if (permissionId != null && permissionId != "") {
				final String[] pIds = permissionId.split(",");
				for (int i = 0; i < pIds.length; i++) {
					final Long id = Long.parseLong(pIds[i]);
					roleService.insertRoleAndPermission(currentRole.getId(), id);
				}
			}
			map.put("result", "success");
		} catch (final Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
			return map;
		}
		log.info("add Role");
		return map;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@Transactional
	public Map<String, String> updateRole(Role role, String permissionId) {
		final Map<String, String> map = new HashMap<>();
		try {
			roleService.updateRole(role);
			roleService.deletePermissionOfRole(role.getId());
			if (permissionId != null && permissionId != "") {
				final String[] pIds = permissionId.split(",");
				for (int i = 0; i < pIds.length; i++) {
					final long id = Long.parseLong(pIds[i]);
					roleService.insertRoleAndPermission(role.getId(), id);
				}
			}
		} catch (final Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
			return map;
		}
		return map;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@Transactional
	public @ResponseBody Map<String, String> deleteRole(Long id) {
		final Map<String, String> map = new HashMap<>();
		try {
			roleService.deletePermissionOfRole(id);
			roleService.deleteRoleOfUser(id);
			roleService.deleteRole(id);
			map.put("result", "success");
		} catch (final Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
			return map;
		}
		return map;
	}

	@RequestMapping(value = "/getPermissionOfRole", method = RequestMethod.POST)
	@Transactional
	public @ResponseBody List<Long> getPermissionOfRole(Long id) {
		log.info("get permission ids of " + id);
		return roleService.selectPermissionOfRole(id);
	}

}
