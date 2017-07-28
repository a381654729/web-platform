package com.hirain.web.ssm.service;

import java.util.List;

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

import com.hirain.web.ssm.entity.Role;
import com.hirain.web.ssm.entity.User;

@Service
@Transactional
public class ShiroRealm extends AuthorizingRealm {

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private PermissionService permissionService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		final String loginName = (String) arg0.fromRealm(getName()).iterator().next();
		final User user = userService.findByName(loginName);
		System.out.println(loginName);
		if (user != null) {
			final SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			info.setRoles(roleService.findRoleNamesByUser(user.getId()));
			final List<Role> roles = user
					.getRoleList();/* roleService.findRolesByUser(user.getId()); */
			for (final Role role : roles) {
				final List<String> permissions = permissionService
						.findPermissionNamesByRole(role.getId());
				info.addStringPermissions(permissions);
			}
			return info;
		}
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken arg0)
			throws AuthenticationException {
		final UsernamePasswordToken token = (UsernamePasswordToken) arg0;
		System.out.println(token.getUsername());
		final User user = userService.findByName(token.getUsername());
		if (user != null) {
			return new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), getName());
		}
		return null;
	}

}
