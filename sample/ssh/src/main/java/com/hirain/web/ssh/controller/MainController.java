package com.hirain.web.ssh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hirain.web.ssh.service.PersonService;

@Controller
public class MainController {

	@Autowired
	private PersonService personService;

	@RequestMapping(value = "savePerson", method = RequestMethod.GET)
	@ResponseBody
	public String savePerson() {
		personService.savePerson();
		return "success!";
	}

	@RequestMapping(value = "test", method = RequestMethod.GET)
	@ResponseBody
	public String test() {
		return "test";
	}
}
