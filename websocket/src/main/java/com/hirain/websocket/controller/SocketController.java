package com.hirain.websocket.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.TextMessage;

import com.hirain.websocket.socket.SocketHandler;

@Controller
public class SocketController {

	@Autowired
	private SocketHandler socketHandler;

	@RequestMapping(value = "/login")
	public String login(HttpSession session) {
		System.out.println("用户登录了建立链接了");
		session.setAttribute("user", "sara");
		return "home";
	}

	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public String sendMessage() {
		socketHandler.sendMessageToUser("sara", new TextMessage("这是一条测试的消息"));
		return "message";
	}
}
