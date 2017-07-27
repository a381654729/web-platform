package com.hirain.web.ssm.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hirain.web.ssm.entity.Permission;
import com.hirain.web.ssm.entity.Role;
import com.hirain.web.ssm.entity.User;
import com.hirain.web.ssm.service.UserService;

import lombok.extern.apachecommons.CommonsLog;

@Service
@Transactional
@CommonsLog
public class PermissionRealm extends AuthorizingRealm {

	@Autowired
	private UserService userService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		final String loginName = (String) arg0.fromRealm(getName()).iterator().next();
		final User user = userService.selectUserWithRoles(loginName);
		log.info("----------" + loginName + "-----------");
		if (user != null) {
			final SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			final List<Role> roleList = user.getRoleList();
			info.setRoles(getRoles(roleList));
			for (final Role role : roleList) {
				info.addStringPermissions(getPermissions(role.getPermissionList()));
			}
			return info;
		}
		return null;
	}

	private Set<String> getRoles(List<Role> roleList) {
		final Set<String> roles = new HashSet<>();
		for (final Role role : roleList) {
			roles.add(role.getRolename());
		}
		return roles;
	}

	private Set<String> getPermissions(List<Permission> permissionList) {
		final Set<String> permissions = new HashSet<>();
		for (final Permission permission : permissionList) {
			permissions.add(permission.getPname());
		}
		return permissions;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken arg0)
			throws AuthenticationException {
		final UsernamePasswordToken token = (UsernamePasswordToken) arg0;
		log.info("------------" + token.getUsername() + "--------------");
		final User user = userService.selectUser(token.getUsername());
		if (user != null) {
			return new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), getName());
		}
		return null;
	}

}
