package com.hirain.web.ssm.service;

import java.util.List;
import java.util.Set;

import com.hirain.web.ssm.entity.Role;

public interface RoleService {

	public Set<String> findRoleNamesByUser(Long id);

	public List<Role> findRolesByUser(Long id);
}
