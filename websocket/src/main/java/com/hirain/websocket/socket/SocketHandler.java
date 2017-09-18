package com.hirain.websocket.socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

@Service
public class SocketHandler implements WebSocketHandler {

	private static final List<WebSocketSession> users = new ArrayList<>();

	@Override
	public void afterConnectionClosed(WebSocketSession arg0, CloseStatus arg1) throws Exception {
		System.out.println("�����ѹر�");
		users.remove(arg0);
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession arg0) throws Exception {
		System.out.println("�ɹ�����socket����");
		users.add(arg0);
		final String username = arg0.getHandshakeAttributes().get("user").toString();
		if (username != null) {
			arg0.sendMessage(new TextMessage("�����Ѿ��ɹ�����socketͨ����"));
		}
	}

	@Override
	public void handleMessage(WebSocketSession arg0, WebSocketMessage<?> arg1) throws Exception {

	}

	@Override
	public void handleTransportError(WebSocketSession arg0, Throwable arg1) throws Exception {
		if (arg0.isOpen()) {
			arg0.close();
		}
		System.err.println("���ӳ��ִ���" + arg1.toString());
		users.remove(arg0);
	}

	@Override
	public boolean supportsPartialMessages() {
		return false;
	}

	public void sendMessageToUsers(TextMessage message) {
		for (final WebSocketSession user : users) {
			try {
				if (user.isOpen()) {
					user.sendMessage(message);
				}
			} catch (final IOException e) {
				e.printStackTrace();
			}
		}
	}

	public void sendMessageToUser(String userName, TextMessage message) {
		for (final WebSocketSession user : users) {
			if (user.getHandshakeAttributes().get("user").equals(userName)) {
				try {
					if (user.isOpen()) {
						user.sendMessage(message);
					}
				} catch (final IOException e) {
					e.printStackTrace();
				}
				break;
			}
		}
	}

}
