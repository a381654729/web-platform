package com.hirain.web.ssm.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hirain.web.ssm.entity.User;

import lombok.extern.apachecommons.CommonsLog;

@Controller
@CommonsLog
public class LoginController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(User currentUser, HttpServletRequest request) {
		final ModelAndView mav = new ModelAndView();
		final Subject subject = SecurityUtils.getSubject();
		final String username = currentUser.getUsername();
		final String password = currentUser.getPassword();
		mav.addObject("inputUsername", username);
		if (username == null || username.equals("")) {
			mav.addObject("msg", "用户名不能为空");
			return mav;
		}
		if (password == null || password.equals("")) {
			mav.addObject("msg", "密码不能为空");
			return mav;
		}
		try {
			log.info(username + " login!");
			final UsernamePasswordToken token = new UsernamePasswordToken(username, password);
			subject.login(token);
			subject.getSession().setAttribute("loginName", username);
			subject.getSession().setAttribute("remoteIp", getRemoteIpAddr(request));
			mav.setViewName("blank");
			return mav;
		} catch (final AuthenticationException e) {
			mav.addObject("msg", "用户名或密码不正确");
			mav.setViewName("login");
			return mav;
		} catch (final Exception e) {
			e.printStackTrace();
			mav.addObject("msg", "exception");
			mav.setViewName("login");
			return mav;
		}
	}

	@RequestMapping(value = "/logout")
	public String logout() {
		SecurityUtils.getSubject().logout();
		return "redirect:/";
	}

	public String getRemoteIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
}
