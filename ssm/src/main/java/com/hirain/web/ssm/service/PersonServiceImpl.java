package com.hirain.web.ssm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hirain.web.ssm.entity.Person;
import com.hirain.web.ssm.mapping.PersonMapper;

@Service("personService")
public class PersonServiceImpl implements PersonService {

	@Autowired
	private PersonMapper personMapper;

	@Override
	public int savePerson() {
		final Person person = new Person();
		person.setUsername("XRog1");
		person.setPhone("12345678910");
		person.setAddress("beijing");
		person.setRemark("hello world");
		return personMapper.insert(person);
	}

}
