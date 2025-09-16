package net.koreate.bookstore.chat.controller;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import net.koreate.bookstore.vo.MessageVO;
import net.koreate.bookstore.chat.service.ChatService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ChatStompController {

	private final SimpMessagingTemplate mt;
	private final ChatService cs;

	// 방 기반(1:1 방 포함) 메시지 라우팅: /app/chat/{roomId}
	@MessageMapping("/chat/{roomId}")
	public void handleRoomMessage(@DestinationVariable("roomId") int roomId, @Payload MessageVO payload) {
		payload.setChatroom_num(roomId);
		log.info("STOMP 수신 roomId={}, sender={}, text='{}'", roomId, payload.getSender_member_num(), payload.getMessage_content());
		try {
			boolean saved = cs.sendMessage(payload);
			// 메시지 전송 후 발신자의 모든 메시지를 읽음 처리
			if (saved) {
				cs.markAllMessagesAsRead(roomId, payload.getSender_member_num());
			}
		} catch (Exception e) {
			log.error("메시지 저장 실패", e);
		}
		String destination = "/topic/chat." + roomId;
		mt.convertAndSend(destination, payload);
	}

	// STOMP: 읽음 처리 전용 엔드포인트
	@MessageMapping("/chat/{roomId}/read")
	public void markRoomRead(@DestinationVariable("roomId") int roomId, @Payload MessageVO payload) {
		try {
			cs.markAllMessagesAsRead(roomId, payload.getSender_member_num());
			log.info("읽음 처리 완료: roomId={}, member_num={}", roomId, payload.getSender_member_num());
		} catch (Exception e) {
			log.error("읽음 처리 실패: roomId=" + roomId + ", member_num=" + payload.getSender_member_num(), e);
		}
	}
	
	// 웹소켓 구독 시 메시지 읽음 처리
	@SubscribeMapping("/chat/{roomId}")
	public void handleChatRoomSubscription(@DestinationVariable("roomId") int roomId, @Payload MessageVO payload) {
		log.info("채팅방 구독: roomId={}, member_num={}", roomId, payload.getSender_member_num());
		try {
			// 웹소켓 연결 시 해당 채팅방의 모든 메시지를 읽음 처리
			boolean success = cs.markAllMessagesAsRead(roomId, payload.getSender_member_num());
			if (success) {
				log.info("메시지 읽음 처리 완료: roomId={}, member_num={}", roomId, payload.getSender_member_num());
			}
		} catch (Exception e) {
			log.error("메시지 읽음 처리 실패", e);
		}
	}
	
	@GetMapping("chat/chatroom")
	public String chat() {
		return "chat/chatDetail";
	}
}