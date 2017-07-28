package com.hirain.web.ssm.mapping;

import org.springframework.stereotype.Repository;

import com.hirain.web.ssm.entity.Person;

@Repository("personMapper")
public interface PersonMapper {

	int deleteByPrimaryKey(Long id);

	int insert(Person record);

	int insertSelective(Person record);

	Person selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(Person record);

	int updateByPrimaryKey(Person record);
}