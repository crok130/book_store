package net.koreate.bookstore.chat.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.koreate.bookstore.chat.service.ChatService;
import net.koreate.bookstore.vo.ChatVO;
import net.koreate.bookstore.vo.MemberVO;
import net.koreate.bookstore.vo.MessageVO;

@RestController
@Slf4j
@RequiredArgsConstructor
public class ChatRESTController {
	
	private final ChatService cs;
	
	@GetMapping("chat/chatAside")
	public List<ChatVO> chatAside(HttpSession session) throws Exception{
		int member_num= ((MemberVO) session.getAttribute("userInfo")).getMember_num();
		List<ChatVO> list = new ArrayList<>();
		list = cs.getChatRoomList(member_num);
		return list;
	}

	// 거래글에서 채팅 시작: 기존 방이 있으면 재사용, 없으면 생성 후 방번호 반환
	@PostMapping("chat/start")
	public ResponseEntity<String> startChat(@RequestParam("tradebook_num") int tradebook_num,
			HttpSession session) throws Exception {
		MemberVO user = (MemberVO) session.getAttribute("userInfo");
		if (user == null) return ResponseEntity.status(401).body("LOGIN_REQUIRED");
		int roomId = cs.startChat(tradebook_num, user.getMember_num());
		if (roomId <= 0) return ResponseEntity.status(400).body("FAIL");
		return ResponseEntity.ok(String.valueOf(roomId));
	}
	
	@GetMapping("chat/chatcontent")
	public List<MessageVO> chatContent(@RequestParam("chatroom_num") int chatroomNum) throws Exception {
		log.info("chatcontent 요청 chatroom_num={}", chatroomNum);
		return cs.getMessageList(chatroomNum);
	}
	
	@PutMapping("chat/complete")
	public ResponseEntity<String> complete(@RequestParam("chatroom_num") int chatroom_num,
			@RequestParam("member_num") int member_num) {
		try {
			boolean completed = cs.confirmPaymentAndMaybeCompleteTrade(chatroom_num, member_num);
			return ResponseEntity.ok(completed ? "COMPLETED" : "CONFIRMED");
		} catch (Exception e) {
			return ResponseEntity.status(500).body("ERROR");
		}
	}
	
	// REST 읽음 처리 제거: 읽음 처리는 STOMP 컨트롤러에서 처리합니다.
}
