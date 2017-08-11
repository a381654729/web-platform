package com.hirain.web.ssm.service;

import java.util.List;

import com.hirain.web.ssm.entity.Role;

public interface RoleService {

	public List<Role> selectAll();

	public void updateUserAndRole(String cname, Long userId);

	public void insert(Role role);

	public Role selectByName(String cname);

	public void insertRoleAndPermission(Long roleId, Long permissionId);

	public void deleteRole(Long id);

	public void deletePermissionOfRole(Long id);

	public void deleteRoleOfUser(Long id);

	public List<Long> selectPermissionOfRole(Long id);

	public void updateRole(Role role);
}
