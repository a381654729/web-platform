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
	public Person load(final Long id) {
		return (Person) getCurrentSession().load(Person.class, id);
	}

	@Override
	public Person get(final Long id) {
		return (Person) getCurrentSession().get(Person.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Person> findAll() {
		return getCurrentSession().createCriteria(Person.class).list();
	}

	@Override
	public void persist(final Person entity) {
		getCurrentSession().persist(entity);
	}

	@Override
	public Long save(final Person entity) {
		return (Long) getCurrentSession().save(entity);
	}

	@Override
	public void saveOrUpdate(final Person entity) {
		getCurrentSession().saveOrUpdate(entity);
	}

	@Override
	public void delete(final Long id) {
		final Person person = load(id);
		final Session currentSession = getCurrentSession();
		currentSession.delete(person);
		currentSession.flush();
	}

	@Override
	public void flush() {
		getCurrentSession().flush();
	}

}
