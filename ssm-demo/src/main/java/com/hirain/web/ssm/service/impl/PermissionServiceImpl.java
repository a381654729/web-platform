package com.hirain.web.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hirain.web.ssm.entity.Permission;
import com.hirain.web.ssm.mapping.PermissionMapper;
import com.hirain.web.ssm.service.PermissionService;

@Service
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	private PermissionMapper permissionDao;

	@Override
	public List<Permission> selectAll() {
		return permissionDao.selectAll();
	}

	@Override
	public void deletePermissionByRole(Long roleId) {
		permissionDao.deletePermissionByRole(roleId);
	}

}
