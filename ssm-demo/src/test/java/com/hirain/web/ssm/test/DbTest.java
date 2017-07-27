package com.hirain.web.ssm.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.hirain.web.ssm.entity.Permission;
import com.hirain.web.ssm.entity.Role;
import com.hirain.web.ssm.entity.User;

public class DbTest {

	@Test
	public void testUser() {
		final SqlSession session = MyBatisUtil.getSqlSession();

		final String statement = "com.hirain.web.ssm.mapping.UserMapper.selectWithRoles";

		final User user = session.selectOne(statement, "admin");
		if (user.getRoleList() != null) {
			System.out.println(user.getRoleList().size());
			for (final Role role : user.getRoleList()) {
				System.out.println("role:" + role.getRolename());
				if (role.getPermissionList() != null) {
					System.out.println(role.getPermissionList().size());
					for (final Permission permission : role.getPermissionList()) {
						System.out.println("perm:" + permission.getPname());
					}
				}
			}
		}
		session.close();
		System.out.println(user.getUsername());
	}
}
