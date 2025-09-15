package net.koreate.bookstore.chat.controller;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import net.koreate.bookstore.vo.MessageVO;
import net.koreate.bookstore.chat.service.ChatService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatStompController {

	private final SimpMessagingTemplate messagingTemplate;
	private final ChatService chatService;

	public ChatStompController(SimpMessagingTemplate messagingTemplate, ChatService chatService) {
		this.messagingTemplate = messagingTemplate;
		this.chatService = chatService;
	}

	// 방 기반(1:1 방 포함) 메시지 라우팅: /app/chat/{roomId}
	@MessageMapping("/chat/{roomId}")
	public void handleRoomMessage(@DestinationVariable("roomId") int roomId, @Payload MessageVO payload) {
		payload.setChatroom_num(roomId);
		log.info("STOMP 수신 roomId={}, sender={}, text='{}'", roomId, payload.getSender_member_num(), payload.getMessage_content());
		try {
			boolean saved = chatService.sendMessage(payload);
			log.info("DB 저장 결과: {}", saved);
		} catch (Exception e) {
			log.error("메시지 저장 실패", e);
		}
		String destination = "/topic/chat." + roomId;
		messagingTemplate.convertAndSend(destination, payload);
	}
	
	@GetMapping("chat/chatroom")
	public String chat() {
		return "chat/chatDetail";
	}
}


