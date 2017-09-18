package com.hirain.websocket.socket;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

public class WebSocketInterceptor implements HandshakeInterceptor {

	@Override
	public void afterHandshake(ServerHttpRequest arg0, ServerHttpResponse arg1,
			WebSocketHandler arg2, Exception arg3) {

	}

	@Override
	public boolean beforeHandshake(ServerHttpRequest arg0, ServerHttpResponse arg1,
			WebSocketHandler arg2, Map<String, Object> arg3) throws Exception {
		if (arg0 instanceof ServerHttpRequest) {
			final ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) arg0;
			final HttpSession session = servletRequest.getServletRequest().getSession();
			if (session != null) {
				arg3.put("user", session.getAttribute("user"));
			}
		}
		return true;
	}

}
