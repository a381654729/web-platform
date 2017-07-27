package com.hirain.web.ssh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hirain.web.ssh.entity.Person;
import com.hirain.web.ssh.repository.PersonRepository;

@Service
public class PersonServiceImpl implements PersonService {

	@Autowired
	private PersonRepository personRespository;

	@Override
	public Long savePerson() {
		final Person person = new Person();
		person.setUsername("XRog");
		person.setPhone("12345678910");
		person.setAddress("beijing");
		person.setRemark("hello world");
		return personRespository.save(person);
	}

}
