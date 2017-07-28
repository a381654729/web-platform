package com.hirain.web.ssm.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hirain.web.ssm.entity.User;

@Controller
public class HomeController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm(Model model) {
		model.addAttribute("user", new User());
		return "/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(User user, BindingResult bindingResult,
			RedirectAttributes redirectAttributes) {
		try {
			if (bindingResult.hasErrors()) {
				return "/login";
			}
			SecurityUtils.getSubject()
					.login(new UsernamePasswordToken(user.getUsername(), user.getPassword()));
			System.out.println("user");
			return "user";
		} catch (final AuthenticationException e) {
			redirectAttributes.addFlashAttribute("message", "用户名或密码错误");
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/user")
	public String user() {
		return "user";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(RedirectAttributes redirectAttributes) {
		SecurityUtils.getSubject().logout();
		redirectAttributes.addFlashAttribute("message", "您已安全退出");
		return "redirect:/login";
	}

	@RequestMapping("/403")
	public String unauthorizedRole() {
		return "/403";
	}
}
