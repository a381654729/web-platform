package com.hirain.web.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hirain.web.ssm.entity.Role;
import com.hirain.web.ssm.mapping.RoleMapper;
import com.hirain.web.ssm.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleDao;

	@Override
	public List<Role> selectAll() {
		return roleDao.selectAll();
	}

}
