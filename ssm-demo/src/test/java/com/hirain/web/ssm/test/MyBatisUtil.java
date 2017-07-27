package com.hirain.web.ssm.test;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtil {

	/**
	 * ��ȡSqlSessionFactory
	 * 
	 * @return SqlSessionFactory
	 */
	public static SqlSessionFactory getSqlSessionFactory() {
		final String resource = "com/hirain/web/ssm/test/conf.xml";
		Reader reader;
		try {
			reader = Resources.getResourceAsReader(resource);
			final SqlSessionFactory fa = new SqlSessionFactoryBuilder().build(reader);
			return fa;
		} catch (final IOException e) {
			e.printStackTrace();
		}
		// final InputStream is = MyBatisUtil.class.getClassLoader().getResourceAsStream(resource);
		// final SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
		return null;
	}

	/**
	 * ��ȡSqlSession
	 * 
	 * @return SqlSession
	 */
	public static SqlSession getSqlSession() {
		return getSqlSessionFactory().openSession();
	}

	/**
	 * ��ȡSqlSession
	 * 
	 * @param isAutoCommit
	 *            true ��ʾ������SqlSession������ִ����SQL֮����Զ��ύ����
	 *            false ��ʾ������SqlSession������ִ����SQL֮�󲻻��Զ��ύ������ʱ����Ҫ�����ֶ�����sqlSession.commit()�ύ����
	 * @return SqlSession
	 */
	public static SqlSession getSqlSession(boolean isAutoCommit) {
		return getSqlSessionFactory().openSession(isAutoCommit);
	}
}