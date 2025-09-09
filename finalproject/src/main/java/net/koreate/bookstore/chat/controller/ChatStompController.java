package net.koreate.bookstore.chat.controller;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import net.koreate.bookstore.vo.MessageVO;

@Controller
public class ChatStompController {

	private final SimpMessagingTemplate messagingTemplate;

	public ChatStompController(SimpMessagingTemplate messagingTemplate) {
		this.messagingTemplate = messagingTemplate;
	}

	// 방 기반(1:1 방 포함) 메시지 라우팅: /app/chat/{roomId}
	@MessageMapping("/chat/{roomId}")
	public void handleRoomMessage(@DestinationVariable("roomId") int roomId, @Payload MessageVO payload) {
		payload.setChatroom_num(roomId);
		String destination = "/topic/chat." + roomId;
		messagingTemplate.convertAndSend(destination, payload);
	}
}


