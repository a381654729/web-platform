package com.hirain.web.ssh.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hirain.web.ssh.entity.Person;

public interface PersonRepository extends JpaRepository<Person, Long> {

}
