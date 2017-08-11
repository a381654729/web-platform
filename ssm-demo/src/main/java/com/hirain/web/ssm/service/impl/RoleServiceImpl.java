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

	@Override
	public void updateUserAndRole(String cname, Long userId) {
		final Role role = roleDao.selectByCname(cname);
		if (role != null) {
			roleDao.insertUserAndRole(role.getId(), userId);
		}
	}

	@Override
	public void insert(Role role) {
		roleDao.insertSelective(role);
	}

	@Override
	public Role selectByName(String cname) {
		return roleDao.selectByCname(cname);
	}

	@Override
	public void insertRoleAndPermission(Long roleId, Long permissionId) {
		roleDao.insertRoleAndPermission(roleId, permissionId);
	}

	@Override
	public void deleteRole(Long id) {
		roleDao.deleteByPrimaryKey(id);
	}

	@Override
	public void deletePermissionOfRole(Long id) {
		roleDao.deletePermissionOfRole(id);
	}

	@Override
	public void deleteRoleOfUser(Long id) {
		roleDao.deleteRoleOfUser(id);
	}

	@Override
	public List<Long> selectPermissionOfRole(Long id) {
		return roleDao.selectPermissionOfRole(id);
	}

	@Override
	public void updateRole(Role role) {
		roleDao.updateByPrimaryKeySelective(role);
	}

}
