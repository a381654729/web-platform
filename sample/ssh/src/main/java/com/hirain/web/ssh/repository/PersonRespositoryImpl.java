package com.hirain.web.ssh.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hirain.web.ssh.entity.Person;

@Repository
public class PersonRespositoryImpl implements PersonRepository {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getCurrentSession() {
		return sessionFactory.openSession();
	}

	@Override
	public Person load(Long id) {
		return (Person) getCurrentSession().load(Person.class, id);
	}

	@Override
	public Person get(Long id) {
		return (Person) getCurrentSession().get(Person.class, id);
	}

	@Override
	public List<Person> findAll() {
		return null;
	}

	@Override
	public void persist(Person entity) {
		getCurrentSession().persist(entity);
	}

	@Override
	public Long save(Person entity) {
		return (Long) getCurrentSession().save(entity);
	}

	@Override
	public void saveOrUpdate(Person entity) {
		getCurrentSession().saveOrUpdate(entity);
	}

	@Override
	public void delete(Long id) {
		final Person person = load(id);
		getCurrentSession().delete(person);
	}

	@Override
	public void flush() {
		getCurrentSession().flush();
	}

}
