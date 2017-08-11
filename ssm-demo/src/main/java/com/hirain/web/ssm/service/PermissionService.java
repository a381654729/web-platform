package com.hirain.web.ssm.service;

import java.util.List;

import com.hirain.web.ssm.entity.Permission;

public interface PermissionService {

	public List<Permission> selectAll();

	public void deletePermissionByRole(Long roleId);

}
