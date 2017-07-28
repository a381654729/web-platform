package com.hirain.web.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hirain.web.ssm.mapping.PermissionMapper;

@Service
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	private PermissionMapper permissionDao;

	@Override
	public List<String> findPermissionNamesByRole(Long id) {
		return permissionDao.selectByRole(id);
	}

}
