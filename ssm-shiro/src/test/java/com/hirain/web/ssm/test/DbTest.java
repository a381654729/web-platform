package com.hirain.web.ssm.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.hirain.web.ssm.entity.Role;
import com.hirain.web.ssm.entity.User;

public class DbTest {

	@Test
	public void testUser() {
		final SqlSession session = MyBatisUtil.getSqlSession();

		final String statement = "com.hirain.web.ssm.mapping.UserMapper.selectWithRoles";

		final User user = session.selectOne(statement, "tom");
		for (final Role role : user.getRoleList()) {
			System.out.println(role.getRolename());
		}
		session.close();
		System.out.println(user.getUsername());
	}
}
