package com.hirain.web.ssm.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hirain.web.ssm.service.PersonService;

@Controller
public class PersonController {

	@Resource
	private PersonService personService;

	@RequestMapping(value = "savePerson", method = RequestMethod.GET)
	@ResponseBody
	public String savePerson() {
		personService.savePerson();
		return "success!";
	}
}
