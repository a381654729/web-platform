package com.hirain.web.ssm.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hirain.web.ssm.entity.Role;
import com.hirain.web.ssm.mapping.RoleMapper;

@Service
public class RoleServiceImple implements RoleService {

	@Autowired
	private RoleMapper roleDao;

	@Override
	public Set<String> findRoleNamesByUser(Long id) {
		final List<Role> roles = findRolesByUser(id);
		final Set<String> nameOfRoles = new HashSet<>();
		for (final Role role : roles) {
			nameOfRoles.add(role.getRolename());
		}
		return nameOfRoles;
	}

	@Override
	public List<Role> findRolesByUser(Long id) {
		final List<Long> idList = roleDao.selectByUser(id);
		final List<Role> roles = new ArrayList<>();
		for (final Long roleId : idList) {
			final Role role = roleDao.selectByPrimaryKey(roleId);
			roles.add(role);
		}
		return roles;
	}

}
